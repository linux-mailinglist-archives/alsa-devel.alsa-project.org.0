Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A1E7BE5A9
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 17:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1506CE85;
	Mon,  9 Oct 2023 17:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1506CE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867094;
	bh=r2sV2doypAlbB9wakBXiDHbgGfeqKqceo4LqYdnL2M4=;
	h=Date:To:From:Subject:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tdLdsYC0RK0OZ8mVaLsFFb/zqa228/fXHWar5asXHf1i2gzV/NlqP+zIxRwSCTSLB
	 9AyBUU0v6iUlFD0ljhIfFBq/bWUare7w/yNc2zQPiiKZcAknYvgCA+UUFtSEsnEW1z
	 eUDZfjrue9udmycVhDWLKT5CZBG52uqU5iPyvQnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88B10F802BE; Mon,  9 Oct 2023 17:57:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE921F8027B;
	Mon,  9 Oct 2023 17:57:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABB98F8047D; Sat,  7 Oct 2023 13:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ACDCF801EB
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 13:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACDCF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jLicWJxj
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c60778a3bfso24969455ad.1
        for <alsa-devel@alsa-project.org>;
 Sat, 07 Oct 2023 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696679041; x=1697283841;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:to:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAOEMwlAn3oe/W9lVBHM+ePb4EYJS/tiOc3Kz3nTE8g=;
        b=jLicWJxj0QQyhj/rxLWtpVN8gFMWIg1Yk4kOnyAO4BjBB2fwJ8y93z0nS+SVo6zIDG
         mfcgtHTOmU7zNypot4nZQCKI4i8QwoDTWnPUtVR6kPjnSMbYWwUqxUliDqHgBM24PPdD
         x4cXuoVk84YTXByosKy3OoTAvc4JUIdikdsuTo6JoX9aPsXc2tMLTbTngiRUjWxEYjTS
         DUR/gLifD1BgO8Xcwd6q7QUQJJ06mvh07YCqNXjC0UkYOTAomRXq+agq7w4NBOMVh34u
         yZpXHUweeJeVlp5JDz1A/pJs5oFV3PzspWscrkOFlzKgpogdlJSykr1MI7BjxH/sr0Wr
         PJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696679041; x=1697283841;
        h=content-transfer-encoding:subject:from:to:content-language:reply-to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAOEMwlAn3oe/W9lVBHM+ePb4EYJS/tiOc3Kz3nTE8g=;
        b=VRMLCPdRfxX2jk9i5iWW1xxHgu5v1++9JpD8fKJqszSVG/KgSq0koBYhJQxhZ1mn36
         uNHLcnO0iyjrMZSZJzITJ1YcF6iq/g3hKdMjKZZsirkcDBTZnzkarRPxNfbfIaI+UtWN
         pWkhfzQNLSnu+/B62clJIoipTh7VOHPBvBZ75hbHlLUmoRAVghzlOWL9/nIAmX1DGibw
         qpeLHXE58lSnFq2Km16kmHTP1qS4OjroF1SX5sxJU7/8gFO4sVqtOvmPqVewmGk/d5zb
         LtTsY0AGis5H7C/+Mt1DTWWOEnB3Da4uvsSgKE7VwjaX8jwfZtNNqP0QgQcQ9k/5Y0VY
         SeGg==
X-Gm-Message-State: AOJu0Yw+LGyWu9JWJ0kbkvksUjtIEi3ERaBx/fmBp1spfUR00rPCu6tI
	XLOLBNV7b7yTfD6Zv3XXHK2QSSFSsO5tGQ==
X-Google-Smtp-Source: 
 AGHT+IGfZIj9euX5H/q4CH/J8Ia5FRw2GFKi+0WZG1VzQCUuMB+PPiPemeWVcrVRH2zTF8btD/MkFw==
X-Received: by 2002:a17:902:e74d:b0:1c7:7c2c:f846 with SMTP id
 p13-20020a170902e74d00b001c77c2cf846mr12977267plf.67.1696679041426;
        Sat, 07 Oct 2023 04:44:01 -0700 (PDT)
Received: from [192.168.1.11] (203-174-143-14.can.static-ipl.aapt.com.au.
 [203.174.143.14])
        by smtp.gmail.com with ESMTPSA id
 13-20020a170902c10d00b001bf6ea340a9sm5664116pli.159.2023.10.07.04.43.59
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Oct 2023 04:44:00 -0700 (PDT)
Message-ID: <9c7b08fc-7f00-4894-a5b2-f3fc5f99e022@gmail.com>
Date: Sat, 7 Oct 2023 22:43:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-AU
To: alsa-devel@alsa-project.org
From: Brett Worth <brett.worth@gmail.com>
Subject: [PATCH] hda/realtek: Add SND_PCI_QUIRK entry for the Dell XPS 9530
 laptop for dual speakers
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: brett.worth@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OPQ5MRG65VOUXBY2C4YFGXSQDSTI6JY3
X-Message-ID-Hash: OPQ5MRG65VOUXBY2C4YFGXSQDSTI6JY3
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: brett@worth.au
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPQ5MRG65VOUXBY2C4YFGXSQDSTI6JY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Dell XPS 9530, like previous XPS laptops like the 9520 and 9510 have dual speakers in 
each channel.

If the ALC289_FIXUP_DUAL_SPK flag is not set in sound/pci/hda/patch_realtek.c only the 
tweeter will work and therefore make the sound quality terrible.

This patch has not been tested but is derived from a previous patch attempt from a 
different user called Pentracillin which was rejected.

$ diff -r -up a b
diff -r -up a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
--- a/sound/pci/hda/patch_realtek.c     2023-10-07 22:16:36.129618972 +1100
+++ b/sound/pci/hda/patch_realtek.c     2023-10-07 22:16:52.645258218 +1100
@@ -9412,6 +9412,7 @@ static const struct snd_pci_quirk alc269
        SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
        SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", 
ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
        SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", 
ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+       SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530", ALC289_FIXUP_DUAL_SPK),
        SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", 
ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
        SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
        SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),


I don't have much confidence that this patch request will meet the requirements.

Brett

