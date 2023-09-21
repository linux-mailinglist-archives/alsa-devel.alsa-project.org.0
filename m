Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C6A7A956A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 17:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 424E6AE9;
	Thu, 21 Sep 2023 17:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 424E6AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695308620;
	bh=shaRBQmsfUTVkybTQ5PU1OcWUhpihgEjFoC0hGzDWIU=;
	h=Subject:From:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jd2ijuL5C/fjTlHyYkQWksbA5ePpW5k7wsKtSj/pmXJRVg4mWuEpj61CTGc+jAKMJ
	 eKLJTRXDdclbudubWRSvtzMu9gQP/8b42IQeP7IppNvYgYx2L+9ptDRWXHThgRfCse
	 bzlY5mbKyhNJqMtfN8QM/MHRwas5imNsWw/6FGNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D15F8055C; Thu, 21 Sep 2023 17:02:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 676FDF8055B;
	Thu, 21 Sep 2023 17:02:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53586F8025A; Thu, 21 Sep 2023 16:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74988F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 16:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74988F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nqfA60qm
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50307759b65so1998829e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Sep 2023 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695308390; x=1695913190;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y2cRr9MR3inkHivewxgnnyGI8y8gUo1y4W6FkvAgzTY=;
        b=nqfA60qmEKTLyvP7hrtTAYk7aRc9X3KO90aP2iuRJDn1b3fJBCGCBicvAftOcczQjk
         AtL+j1ULtBMl3zclMAfb8Kx+7Olq4UC3NclDxwT2WjYP5lm9LTvd9KPZpB3EBeyZexaC
         rYcjbwKXB4kocuTqlsPh8VKkURTXsV+3UB35NCqXmeDZFexIUxan9rggzJYCUNx2vMkI
         Yr/BnD3cirsFCFEQzg+Nk0kQxl9AE0GJ10yErWbnoAx+nIlOT2VdN30y0iyN1xv70MgY
         y0lxj12tgAFVt7Fa474fjS53GLpk482K2u6ZraijcmT80qo5T3yjwz8SbhLN3vxJ/Ob5
         8N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695308390; x=1695913190;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2cRr9MR3inkHivewxgnnyGI8y8gUo1y4W6FkvAgzTY=;
        b=WKZ4UTJpp4vZ996j6LgVZrlcEnfeBZI50C7MqNjJZP8DzheHdMowYV+iU+2W61CbbV
         1kyt2LY4vxC3BspTjYThOGWK5kecjcSzqSHmf/0TcRpZNXiF4GdA/cK7Km5Y2UpECVbr
         L640d4iWPZgUcQIHoU9pWKuzMIbB+Y9JFBiQJBI7U01X6WKhn/SNaY1OWSDdmcBXyOeS
         R1v9wTyDTpdfVL3J4l4Ql2MKHvwhlPOwvh+5TLKdpvJUNyEEJfa95dkur3RPZ6AoCd92
         MhB55oZJhAjTC6jcnOO69fumGj4iPNXoSvsHXo+bn6IiSckIvW2KXV22efmjwGX567MJ
         fY2Q==
X-Gm-Message-State: AOJu0Yz9qunbJ23ihgYNbjq+a32DTducttAJSH9aI5D1X5/X6wWusdH+
	XUhyywejpqtZgezjcntHIOU=
X-Google-Smtp-Source: 
 AGHT+IHcq103dNlblMZBQY/j6iBfw4bjgl3Ly21aJcgJdHUNGAfybxeqKUdIET9dZUi0Y+dCo0YrMg==
X-Received: by 2002:a05:6512:2813:b0:503:3803:9e99 with SMTP id
 cf19-20020a056512281300b0050338039e99mr6882214lfb.15.1695308390088;
        Thu, 21 Sep 2023 07:59:50 -0700 (PDT)
Received: from ?IPv6:2600:1700:7c80:b060::49? ([2600:1700:7c80:b060::49])
        by smtp.gmail.com with ESMTPSA id
 l29-20020ac24a9d000000b00503258fa962sm316840lfp.199.2023.09.21.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:59:49 -0700 (PDT)
Message-ID: <ae875c6cd54089a108007f6d32aca2c8e61c0c2e.camel@gmail.com>
Subject: [PATCHv5] ALSA: hda/realtek: Add quirk for ASUS ROG G533Q
From: Abelardo Ricart <aricart@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Date: Thu, 21 Sep 2023 10:59:47 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-MailFrom: aricart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XE537TEFKVDJ5FC6IMUXV5EPSE2FKCQP
X-Message-ID-Hash: XE537TEFKVDJ5FC6IMUXV5EPSE2FKCQP
X-Mailman-Approved-At: Thu, 21 Sep 2023 15:01:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XE537TEFKVDJ5FC6IMUXV5EPSE2FKCQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The same quirk applied to the ASUS G533Z is also applicable to the ASUS G53=
3Q (of which I am an owner and have thus tested).

Signed-off-by: Abelardo Ricart <aricart@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b7e78bfcffd8..7bb3c1e05bf2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9781,6 +9781,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MI=
C),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_Z=
ENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MI=
C),
+	SND_PCI_QUIRK(0x1043, 0x1602, "ASUS ROG Strix G15 (G533Q)", ALC285_FIXUP_=
ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK)=
,
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_=
2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
--
2.42.0

