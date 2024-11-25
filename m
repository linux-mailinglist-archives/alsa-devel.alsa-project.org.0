Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1329D7ACC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2024 05:36:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A3E845;
	Mon, 25 Nov 2024 05:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A3E845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732509360;
	bh=P08ZSxG1JViKMGwjIFe+bp10thxQLr6Wi/K5LolL07c=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j32FedON5nioSc6WAgzZS5eI30XCNQojzD96aCbfeqc4vQ0WSfKASfRpHCCCPbghr
	 xdG6uFeZgJWKPgVXwZXKKGRsI+s6D/c+Ned0dXuAD8MCNMqm1tCArCbR895FhLD1yo
	 +CKnpd/veIr3KdaHwZY3LRTFDfbGBozD2JaR08Uo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D21CCF805C6; Mon, 25 Nov 2024 05:35:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 509AFF805AD;
	Mon, 25 Nov 2024 05:35:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49FEEF80496; Mon, 25 Nov 2024 05:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_SBL_A shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 753F2F80073
	for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2024 05:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 753F2F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mwRi1rLE
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3825a721ae5so2095079f8f.1
        for <alsa-devel@alsa-project.org>;
 Sun, 24 Nov 2024 20:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732509262; x=1733114062;
 darn=alsa-project.org;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nebrHmWSpSq2eTpftT/Z1+kv5alHbq327RNuG9UPwc=;
        b=mwRi1rLE2+uej9xEX3TrsJiLAY3XY0Zwwpr8ZG6efov1qlIih6PXGrsd9ZVrFVa+yF
         tLzUU0VZJIbMAtEa27vFFewFzMqKU1AylcV5r5auVUDXnNJ5TZ4Kq5aFjprdBEfHasDe
         v3XZMAsyhLtGCBXoVX5A4blsdPg0v05BCyDq+4jpdrSM6CYE+UqNLBVVQ2AkSPQn2q8A
         xGiQUceyWa5KufMquFeYqfcGdz7iyhAz96fHDF/nqM9naMwQjeKRtux0YBIdsayS14Ux
         OTlXV6avwbd3ckBlPR7iTzWeeaKYM3XBlVLLDQEaFl15LhKSkzOTWzDC4I7R8WGmKYXW
         evMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732509262; x=1733114062;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nebrHmWSpSq2eTpftT/Z1+kv5alHbq327RNuG9UPwc=;
        b=kSeM2K8un/Lnj674PlQdlFdpfFgj+s/hzHd97lTHhi2ITQavJFPcL7y+6xb4EInwFe
         3IR+GQt1NtGihSzysMDNfMAIq2r4TrJ4K5rWLbp+oUmymoUC7RjY1boOaUI8cpoHxDD2
         6oR4amUrrqZ5ksBzG+4GITPK229cEbeggoLlDPPDqgTo1rkeedY2DpiBoIPKfMoTkPXT
         utyGbLBJOA4/DsgqKT8GCo69/J3TWH9Bd4jhDU7TzWZ0OKT22xNHYlYJnemp/FtfrbN9
         RdgtZKZv0ed2K8LvlGS+2dVRCXQ7Qgwb2651aWnosDnQNBvtMpxoKrEGPxpVez+KAxAk
         rmRQ==
X-Gm-Message-State: AOJu0Yw3xozlyNTxGViVObjEppiP1fS4h9IJ1YvTsjPgHuBsn0xtBL79
	hTN8CS/n+PPpG5eJ9/vYfqXgChgzNZnMKnbv0HKBJdsmKre8uy36P1tH+w==
X-Gm-Gg: ASbGncsnNu/LVVS8Gu6Eoa0K5FBSoemK4jQ7JB+KppIxJiXT3fdLdXiJCptON/+XexB
	Y36kxXhOpATPlhJvPRGB2GMatnjE3VIDe7QgoKkwo5r5GyelIZwCdD8Ph3s6V4MzPhRsbfwS/LH
	f+aGhjxuEEpB4njPmJ+bAB/63QEdtf8CzetErX0NL9Bl6fUomOJxZyt8W6W40LVybeyxGaR/dN5
	9Ch7KLRwcBmNnKjrCgLAxsi0YFCQmCrgDJlvowvk2vgASoZs0qNj2ru5ryoRW48YzIABwK2QtFd
	KLPjxf/Divc45aXSwQr9a5IkFIIF
X-Google-Smtp-Source: 
 AGHT+IHU26I5VG6ocJXN/euGZ2cU+ia0oxnKcVh15/Xt2qtliOeyCipMtb9HZniJtP2ozESxT2i3+Q==
X-Received: by 2002:a5d:64e7:0:b0:382:442c:2c7d with SMTP id
 ffacd0b85a97d-382604ebfc1mr8296563f8f.8.1732509262395;
        Sun, 24 Nov 2024 20:34:22 -0800 (PST)
Received: from ?IPV6:2a02:8071:3484:bc0:caf7:50ff:fe30:727e?
 ([2a02:8071:3484:bc0:caf7:50ff:fe30:727e])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad6441sm9458371f8f.4.2024.11.24.20.34.21
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 20:34:21 -0800 (PST)
Message-ID: <91e6f615-c894-44b1-bbd3-6d237571539c@gmail.com>
Date: Mon, 25 Nov 2024 05:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: schorpp <thomas.schorpp@gmail.com>
Subject: [BUG] HDA Intel PCH, HDMI , HDA Intel PCH, ALC886 Digital, no IEC958
 / HDMI output/passthrough to AVR, partly fixed but fix broke CM106
To: alsa-devel@alsa-project.org
X-Priority: 4 (Low)
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RUFXZUSAGXQFCYBPHNDENZ5MGC3VPJ2W
X-Message-ID-Hash: RUFXZUSAGXQFCYBPHNDENZ5MGC3VPJ2W
X-MailFrom: thomas.schorpp@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUFXZUSAGXQFCYBPHNDENZ5MGC3VPJ2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> 
>> [BUG] HDA Intel PCH, HDMI , HDA Intel PCH, ALC886 Digital, no IEC958 / HDMI output/passthrough to AVR
>> 
>> ALSA versions 1.0.28
>> 
>> Kernel Driver versions 3.12.40

Partly FIXED in Longterm Stable Kernel 4.19.324 and using HDMI DEV 1 
instead of 0.

2 CH PCM HDMI to AVR works now but AC3/DTS passthrough still not or is 
not recognized by AVR or some wrong AES setting but iec958 optical out 
AC3/DTS output to AVR works.

New BUG: No more 5.1 Analog Output on the CM106 USB Box if AC3 stream is 
selected.

Your ALSA information is located at 
http://alsa-project.org/db/?f=5ef8b56450583ba8afbcc705afc02228da4a3072

y
tom

>> 
>> Hardware:
>> 
>> DFI Mainboard MB330-CRM
>> 
>> https://www.dfi.com/de/product/index/273#specification
>> 
>> Reproducible Always
>> 
>> Steps to reproduce and full report:
>> 
>> https://www-vdr--portal-de.translate.goog/forum/index.php?thread/136519-gel%C3%B6st-xineliboutput-config-f%C3%BCr-dd-passthrough-zu-avr-und-5-1-surround-headset/&postID=1375883&_x_tr_sl=de&_x_tr_tl=en&_x_tr_hl=de&_x_tr_pto=wapp#post1375883
> Output of alsa-info.sh is here
> 
> http://alsa-project.org/db/?f=fc4734deddd9a92331692bf94b15cf84b7722cd4
> 
>> 
>> Software crosscheck with CM106 USB Soundbox iec958: works OK.
>> 
>> Where to start in the drivers source code to fix it?
>> 
>> y
>> tom
>> 
>> 
