Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115636D67D
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 13:31:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF6516C2;
	Wed, 28 Apr 2021 13:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF6516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619609465;
	bh=RqkgiCf8P2hH5lW41ZO6wcqaKLiScWb7MtJn0/aW+BE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tpn/91iNE6a/xzT67jc8Owf+JyPaIhTfFk54OYT1OhHeaqDb78//d69g6aAEaV5uG
	 Hdw67oz7Vn5RgdQk1U5dHIEXrhMGdWsvP6H6NabCtEEis1TA/tbhWsvDlcXNum3lUp
	 M6OScJYckfMDjlQkiyVJ3Y8zkX6YfUq3yO7HeLE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF9DF804D1;
	Wed, 28 Apr 2021 13:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3455F80218; Wed, 28 Apr 2021 13:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BFFCF80218
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 13:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BFFCF80218
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8827DB155
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 11:27:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ALSA: hda: Re-order quirk table entries
Date: Wed, 28 Apr 2021 13:26:51 +0200
Message-Id: <20210428112704.23967-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

this is a series of trivial changes just to re-order the quirk table
entries for HD-audio codec drivers.  We've tried to keep the entries
in the PCI SSID order, but occasionally somd disorder came in.  It's
not only bad for the readability but also leading to the oversight of
duplicated entries or the unreachable entries unexpectedly.

Basically this could be done in a shot by a script, but I split to
parts, so that each piece can be better applied (or fixed) for stable
kernels.

There is one fix patch in the series that addresses the duplicated
entries.  Other than that, all about shuffling and no functional
changes must be introduced by this series.


Takashi

===

Takashi Iwai (13):
  ALSA: hda/realtek: Re-order ALC882 Acer quirk table entries
  ALSA: hda/realtek: Re-order ALC882 Sony quirk table entries
  ALSA: hda/realtek: Re-order ALC882 Clevo quirk table entries
  ALSA: hda/realtek: Re-order ALC269 HP quirk table entries
  ALSA: hda/realtek: Re-order ALC269 Acer quirk table entries
  ALSA: hda/realtek: Re-order ALC269 Dell quirk table entries
  ALSA: hda/realtek: Re-order ALC269 ASUS quirk table entries
  ALSA: hda/realtek: Re-order ALC269 Sony quirk table entries
  ALSA: hda/realtek: Re-order ALC269 Lenovo quirk table entries
  ALSA: hda/realtek: Re-order remaining ALC269 quirk table entries
  ALSA: hda/realtek: Re-order ALC662 quirk table entries
  ALSA: hda/realtek: Remove redundant entry for ALC861 Haier/Uniwill
    devices
  ALSA: hda/conexant: Re-order CX5066 quirk table entries

 sound/pci/hda/patch_conexant.c |  14 ++--
 sound/pci/hda/patch_realtek.c  | 113 ++++++++++++++++-----------------
 2 files changed, 62 insertions(+), 65 deletions(-)

-- 
2.26.2

