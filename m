Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EA329ACA7
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 14:02:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD75A168E;
	Tue, 27 Oct 2020 14:01:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD75A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603803749;
	bh=VMk5Ml6b3m0Uj949CI1y/KAOVWE/X8sDMwwGtDCs89o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EYernuPP++LOevM7S72aAnAK2LPRNJoG03rFJXFb+4OTBe+uK80Ovg/0I5zZb0FSE
	 cK7occHDzM5fmErOzPqsfeT4smDyH7jrLa5SJmbrxAVP7BXL+oRB+hZ+skMooa2/MD
	 EK3PT51KqcyeLUwMOOYM+zC9MLOu6mNPjFsT+ukE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A464F801D8;
	Tue, 27 Oct 2020 14:00:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0023BF80217; Tue, 27 Oct 2020 14:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1175CF800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 14:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1175CF800FF
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kXOah-0007gc-MD; Tue, 27 Oct 2020 13:00:44 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v3 0/3] HDA controller PM and codec PM cleanups
Date: Tue, 27 Oct 2020 21:00:35 +0800
Message-Id: <20201027130038.16463-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, mwolf@adiumentum.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

While working on the issue "ALSA: hda: fix jack detection with Realtek
codecs when in D3", I've found using pm_runtime_force_{suspend,resume}()
have surprising behavior, specifically, pm_runtime_need_not_resume()
uses pm_runtime_need_not_resume() to avoid calling resume callback, so
jackpoll was used to really power up the codec.

We can use direct-complete to do the keep the codec suspended throughout
the system PM flow, namely, keep the codec suspended all the way, unless
the codec needs to be woken up after resume.

For HDA controller, PCI core may enable direct-complete for it if
conditions are met. So make runtime and system PM distinctive to always
apply correct wake up setting.

At least point, hopefully all runtime PM issues are solved, let's enable
runtime PM by default again.

v3:
 - Drop "ALSA: hda: Stop mangling PCI IRQ"

Kai-Heng Feng (3):
  ALSA: hda: Refactor codec PM to use direct-complete optimization
  ALSA: hda: Separate runtime and system suspend
  ALSA: hda: Reinstate runtime_allow() for all hda controllers

 sound/pci/hda/hda_codec.c      | 45 +++++++++++++++---------
 sound/pci/hda/hda_controller.h |  3 +-
 sound/pci/hda/hda_intel.c      | 63 +++++++++++++++++++---------------
 3 files changed, 66 insertions(+), 45 deletions(-)

-- 
2.17.1

