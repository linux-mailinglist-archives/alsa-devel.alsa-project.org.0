Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E485364AE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 17:30:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A73717A8;
	Fri, 27 May 2022 17:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A73717A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653665448;
	bh=xkhHBA7bRSrAPJr5h4TZulw8zemKjw3M91M9jD7Zopw=;
	h=Date:From:To:In-Reply-To:Subject:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F5O5cyNIWXPxpTtE/GYtLeAZQlhoMvfyKZJAGvgI3zAOIDS1ytre30pe3hAvcPnWg
	 YdeZiagyZuwMe++YGmUwsrVr0krM1dMBzXj7JNBIYqNe925dPHMeUl8Hy0FrGAEwhQ
	 QvpwuFQwDHZpI/IHTH+wkvJqjKrfm6mIgobIFqys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E460F80524;
	Fri, 27 May 2022 17:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3095BF802DB; Fri, 27 May 2022 14:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD51FF80100
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 14:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD51FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=upto11.nl header.i=rik@upto11.nl
 header.b="f++mZr3+"
ARC-Seal: i=1; a=rsa-sha256; t=1653653249; cv=none; d=zohomail.eu; s=zohoarc; 
 b=iNsnvnBUhwhGXeBV9hNaUhTcYu6H2RlyzUNgRsFKZJZcIVFXTn9cQZrChew34qsxXgM/KHssx6n0OECdzyYs9sRdIGSrcnx0you7Bqd3vmTk6HNCjiYuc3vOmzABgqpOjxaxZ5vI2NZ/V+f+aJJLENIYW9XCu+ZVWTiD5QVY+5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1653653249;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=uVkIaXpr4VQStsIdQFXdb7LePhf7SNadAEpdnCSbYrg=; 
 b=HUcCdlaa2HJeInOdT5fH8YFp4YwksCkurepMUov3hHseculyojACzUYtFipCAZsn/HZ5eWZvrFgFCxDnl6r6C8x01OLXr3CVzjTjuCGxCf/JknjvUCPR0QBPNg4XFwx9ih3KGg06vv/yYFODmMH9qmRhgAVXCpNvCZVN5lpitXo=
ARC-Authentication-Results: i=1; mx.zohomail.eu; dkim=pass  header.i=upto11.nl;
 spf=pass  smtp.mailfrom=rik@upto11.nl;
 dmarc=pass header.from=<rik@upto11.nl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653653249; 
 s=zoho; d=upto11.nl; i=rik@upto11.nl;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=uVkIaXpr4VQStsIdQFXdb7LePhf7SNadAEpdnCSbYrg=;
 b=f++mZr3+qWGTd909C/LVTauFZiJ0hFkD/mi6WoTbZijKb6oMzrFrS4vUz63D7tT+
 OD/SAUkARDDWBdwDyBpyH1tWvCnDU/8eOMUiqV+1eGeEL6f6dxcBS15CDY9uItRSG1H
 4vod+HmjQVelXcLBz3n1kWvAl9nJBmgS2+12/lDM=
Received: from mail.zoho.eu by mx.zoho.eu
 with SMTP id 1653653246858819.298769045592;
 Fri, 27 May 2022 14:07:26 +0200 (CEST)
Date: Fri, 27 May 2022 14:07:26 +0200
From: Rik van der Kemp <rik@upto11.nl>
To: "Takashi Iwai" <tiwai@suse.com>
Message-ID: <181056a137b.d14baf90133058.8425453735588429828@upto11.nl>
In-Reply-To: 
Subject: [Patch] ALSA: hda/realtek: Enable 4-speaker output for Dell XPS 15
 9520 laptop
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Fri, 27 May 2022 17:28:30 +0200
Cc: alsa-devel <alsa-devel@alsa-project.org>
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

The 2022-model XPS 15 appears to use the same 4-speakers-on-ALC289 audio setup as the Dell XPS 15 9510, so requires the same quirk to enable woofer output. Tested on my own 9520. 

Signed-off-by: Rik van der Kemp <rik@upto11.nl>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 80e4955e8c10..e64597f2675b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8902,6 +8902,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x1028, 0x0a38, "Dell Latitude 7520", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE_QUIET),
        SND_PCI_QUIRK(0x1028, 0x0a58, "Dell", ALC255_FIXUP_DELL_HEADSET_MIC),
        SND_PCI_QUIRK(0x1028, 0x0a61, "Dell XPS 15 9510", ALC289_FIXUP_DUAL_SPK),
+       SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
        SND_PCI_QUIRK(0x1028, 0x0a62, "Dell Precision 5560", ALC289_FIXUP_DUAL_SPK),
        SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
        SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),



BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216035
Signed-off-by: Rik van der Kemp <rik@upto11.nl>


