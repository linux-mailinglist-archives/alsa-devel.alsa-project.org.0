Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D82ED13C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 14:59:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BADD1689;
	Thu,  7 Jan 2021 14:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BADD1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610027983;
	bh=WNVXTXt0qOFRZW33ysQ0saqQzzLg6axjVhIQzzLFimM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ITTeqxqW1zWgFamL1PVC1eTDkiHOkeP8o1BbuI67APbBLDGe+ws73y7MieUiIoKAk
	 ge7ErmPEWCZPJ0LxGxaKVKtFWgBEMeaFWWyBV7eqsFsxv+BNL9GlapC2BWns+PZ7mu
	 ENLXK6lCzIRDmHu1E9G/BlolnRW3dV2KDv/c3kgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3FFF8049C;
	Thu,  7 Jan 2021 14:58:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61373F8049C; Thu,  7 Jan 2021 14:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49558F800E9
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 14:58:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49558F800E9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D912B718;
 Thu,  7 Jan 2021 13:58:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 0/5] ALSA: usb-audio: Fix regression for Pioneer devices
Date: Thu,  7 Jan 2021 14:57:56 +0100
Message-Id: <20210107135801.23860-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

Hi,

here is the revised patch set for addressing the regression reported
for Pioneer devices with the implicit feedback mode.


Takashi

===

Takashi Iwai (5):
  ALSA: usb-audio: Fix the missing endpoints creations for quirks
  ALSA: usb-audio: Choose audioformat of a counter-part substream
  ALSA: usb-audio: Avoid unnecessary interface re-setup
  ALSA: usb-audio: Annotate the endpoint index in audioformat
  ALSA: usb-audio: Fix implicit feedback sync setup for Pioneer devices

 sound/usb/card.c         |  5 +--
 sound/usb/card.h         |  3 ++
 sound/usb/endpoint.c     | 84 ++++++++++++++++++++++++++++++++++------
 sound/usb/endpoint.h     |  2 +-
 sound/usb/implicit.c     | 55 +++++++++++++++++++-------
 sound/usb/quirks-table.h |  6 +++
 sound/usb/quirks.c       | 54 +++++++++++++++++++++-----
 sound/usb/usbaudio.h     |  1 +
 8 files changed, 169 insertions(+), 41 deletions(-)

-- 
2.26.2

