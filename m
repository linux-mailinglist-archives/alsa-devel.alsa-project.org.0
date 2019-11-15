Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4985FDE3D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2750C166D;
	Fri, 15 Nov 2019 13:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2750C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573822007;
	bh=ydadHCwNqCYotg4dulY/7Bl6JulnKDh0cMSwYtKeJwo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E9PbmdSzMu6ULt4N40bxNVjv6/ZeQJvBNQwhyxV+9Wv0XLwXmH/jRTMqdm8v9JncD
	 ku1Bu/EA+hHhekS0/Fppx2R5KVMsrq4pzlid7Rm4KzvL/Wpyn/N6ZhptnzL5hFHAHz
	 B2w+NcuxyxpZe4J/FGEkNDoWisjENJFQffgkNLoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F326F80109;
	Fri, 15 Nov 2019 13:45:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D1D9F80104; Fri, 15 Nov 2019 13:45:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0161FF800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0161FF800CC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 04:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="214772939"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2019 04:44:52 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri, 15 Nov 2019 14:44:46 +0200
Message-Id: <20191115124449.20512-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 0/3] HDA fixes to multiple Intel platforms
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hey,
here's a small set of HDA patches touching Intel specific
code. First is an important bugfix to TGL platforms
and latter are cleanups for code that is no longer needed.

Kai Vehmanen (3):
  ALSA: hda: hdmi - fix port numbering for ICL and TGL platforms
  ALSA: hda: hdmi - remove redundant code comments
  ALSA: hda - remove forced polling workaround for CFL and CNL

 sound/pci/hda/hda_intel.c  |  6 ------
 sound/pci/hda/patch_hdmi.c | 17 +++++++----------
 2 files changed, 7 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
