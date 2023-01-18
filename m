Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6230D6722AD
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:11:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2BC279B5;
	Wed, 18 Jan 2023 17:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2BC279B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058312;
	bh=Ml5V5T6TqziEd6Q2CvyGbvSS8WfGPtgEvXkznD68Hw0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pDZY9WmUIefSWzXaLw+1kOSKMA//CC4DHn/RDFXBPWeVT9PNpo2dN+i8A+NAWN21X
	 KsgAZEi4NYq4U1D2aEMVTzNmgViG07/Z8FxVav4pGY8WPY9lrAPVeodvKmMIIUuiMz
	 k4OHn6xAw1ESG8gkHE0nYsHukJopYd3yWuSwX1qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C82F80579;
	Wed, 18 Jan 2023 17:08:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAD45F8026D; Wed, 18 Jan 2023 16:31:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33148F8021D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 16:30:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33148F8021D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KBZ6GZBz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674055858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cBeslLgaQAhHwXqElIHukO4p8/F2ZoDcBckbvWQc8og=;
 b=KBZ6GZBzEqIDzvKBS1Aqf/69UQZWnXUwgGuKYsBDkYeQsKdtqR/jotzSDvFC2Gdblvh3NF
 wori4kuQOuSA+lpuZ9qj//X8LYyNU3jlm8ymcoQcOasXKCdot2I6PlYioDW2GbbjSn2GQy
 Jm7o6hGXTDdAen9LodPPagTIwhnUk28=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-1UGZXTk8ObCeqEaDWvwojw-1; Wed, 18 Jan 2023 10:30:56 -0500
X-MC-Unique: 1UGZXTk8ObCeqEaDWvwojw-1
Received: by mail-wr1-f70.google.com with SMTP id
 i28-20020adfa51c000000b002ba26dfcd08so7038173wrb.18
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 07:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:message-id:date
 :organization:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cBeslLgaQAhHwXqElIHukO4p8/F2ZoDcBckbvWQc8og=;
 b=jWfvYddRY4FG+5mvzECqzDca/bPtFNqRpfP3OlfhShFVt4G7pPvdmOmOrIg4mbsjGG
 LzGJNWOPSK2SQmZkaCbkK+rBKnchW27ak5ZV3QF9eo6Nc/kMU8VHHrv1t9lBfiaHYENS
 g+VgxflbTX0TWRl0tnY/GBXPpNy/6XFN6+aYRcWFLUF8AeXh1SmfawCsDTzJqMZELt8Z
 jNFH4qcBRH/QgnWUhjoRAXf25BpgpEaA0FgIUYuarBq69PSftfJQt/rVo1DQQIDYhs6N
 PTtubyoWHCPKwNSBDynkZu86DDA6BGyveBt3rdCHNmwzVkH2HHXd4WyoMHDoZWBG/32a
 0y+g==
X-Gm-Message-State: AFqh2kp6NBIhRLvE4pgPQMXVYnxAuZAd9nnObzQJuSVblBYBs2OsU0+f
 YidP/POdlYd+7rTFrEZA7hG1BOs+Yn2O72fsYFhqXg/gZxeMy5gJDxiQK5AepZuBkSQeg4SttMI
 6KqoLQB0Yn2Y4F9Greab9NLCOUMJiq4H3TJy+yPoPe962yVYbDBQ1aXJiA9QOhBpOL89xQzA0
X-Received: by 2002:a05:600c:714:b0:3d9:ed30:79d with SMTP id
 i20-20020a05600c071400b003d9ed30079dmr7159290wmn.18.1674055855108; 
 Wed, 18 Jan 2023 07:30:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYDQ6No/prHg9BYlXt7ECTiXgvAq7T4q1Bk+cuA5sSivFRcNcM2oFpXHzkkOgHbVQqWiCXTw==
X-Received: by 2002:a05:600c:714:b0:3d9:ed30:79d with SMTP id
 i20-20020a05600c071400b003d9ed30079dmr7159267wmn.18.1674055854778; 
 Wed, 18 Jan 2023 07:30:54 -0800 (PST)
Received: from hathi.site
 (p200300efa70be300b18df5dcfccfbd68.dip0.t-ipconnect.de.
 [2003:ef:a70b:e300:b18d:f5dc:fccf:bd68])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002b9b9445149sm37858595wrn.54.2023.01.18.07.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 07:30:54 -0800 (PST)
Received: from hathi.site (localhost [IPv6:::1])
 by hathi.site (Postfix) with ESMTP id 3679D80928;
 Wed, 18 Jan 2023 16:30:53 +0100 (CET)
From: Mike FABIAN <mfabian@redhat.com>
To: alsa-devel@alsa-project.org
Subject: No sound on HDMI by default on Lenovo T14s using Fedora 37
Organization: Red Hat
X-Face: "';
 oPz9V1+<,`}1ZuxRv~EiSusWq*{Yjr"Sdvbhq'?q=2R\\6Y9O/,SAE`{J|6I=|w/sQg<
 rW_N'E3IV6~f8?\l#Es`]S`mv',PY(`8{$$R?+gLu}Qv/Mn>)?uladFjJ@yl!_p_Jh; 5QxlD6zL:?r
 IXe4FfK$C^mWhh$o`yt; .r.FLZLQOWBt><!; -.DYZ)Nu&1?~*:\36\BGz]"L; nue;
 l\%sJ/]l{is5O Ew?0CF}dPS(ezG0xqUR)xa(L&&c;x{By"`oKvM&i!%+
Date: Wed, 18 Jan 2023 16:30:53 +0100
Message-ID: <s9dy1pzx3ki.fsf@hathi.site>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 17:08:49 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


With a Lenovo Thinkpad T14s (Gen1, Intel version), I tried to get sound
on the monitor speakers via the HDMI cable.

It didn’t work out of the box and after a bit of googling I found:

    https://forums.lenovo.com/t5/ThinkPad-T400-T500-and-newer-T-series-Laptops/T14s-AMD-no-HDMI-audio-on-Linux/m-p/5081195?page=2


which suggested to put

    snd_rn_pci_acp3x.dmic_acpi_check=0

on the kernel command line.

So I tried this:

$ cat /etc/modprobe.d/lenovot14s.conf 
options snd-rn-pci-acp3x dmic_acpi_check=0

And that did make it work indeed.

I have no idea what this means and why this makes it work.

-- 
Mike FABIAN <mfabian@redhat.com>
睡眠不足はいい仕事の敵だ。

