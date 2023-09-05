Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2804792344
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 16:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B373B74C;
	Tue,  5 Sep 2023 16:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B373B74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693922688;
	bh=Rzqw09MrS0Ye1KoVip+pdcl9yQYoQZkzTR76Q+YbdHM=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mi7k2arOFN8j8KiFtyENl5NAVSvxBdFIuF+Q29/elBkWK4A3Vg1L83xp7ShiDZrZx
	 UEpkQQRF4l1U8uAEcgFU6S6ngPIYUDshR79s9d/Bd2068RYOQ4R+f52jpQKFLWUtfP
	 XR2B41ckgHChIlC2EeNgxRyP+g/KW0j2CJG+D00k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 061ACF80494; Tue,  5 Sep 2023 16:03:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F30F8047D;
	Tue,  5 Sep 2023 16:03:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5CDEF80494; Tue,  5 Sep 2023 16:03:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 085E5F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 16:03:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 65D3111E2;
	Tue,  5 Sep 2023 16:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 65D3111E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693922611; bh=N7fteqRmdWQX/o1HykH2l5/xmJyccEfVn3p7GBCdcHY=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=Oa1+xi+TxsjtQP+hy31UkpBphb/96ecog8npLmwfTpu8u4fH5cuAtF3KPTBgbIb7m
	 Aov8OgneBgTunrMdtCdiJN515aHu+kwkoXKumWzdouDuiRfw1+ZqLTLz7GEk0xVXf8
	 6PfulE758WbuWYCSPouL9PeJk/HsPDzTtcOVg+AA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  5 Sep 2023 16:03:28 +0200 (CEST)
Message-ID: <62624a24-67a9-bebc-b704-ad3df2cf1da5@perex.cz>
Date: Tue, 5 Sep 2023 16:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Terry Hummel <Terry.Hummel@catalina.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Dulani McLaurin <Dulani.McLaurin@catalina.com>
References: 
 <BN0PR02MB80455425D6077DEC556A4F83FAE9A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <20945414-c6c0-acf7-8340-9e7697b0e833@perex.cz>
 <BN0PR02MB8045C507932EEDF72FB62783FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Bug Report: Audio issues with CentOS7
In-Reply-To: 
 <BN0PR02MB8045C507932EEDF72FB62783FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GF4IX2TCUXGOO574WNNCTBVRFFZMTM44
X-Message-ID-Hash: GF4IX2TCUXGOO574WNNCTBVRFFZMTM44
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GF4IX2TCUXGOO574WNNCTBVRFFZMTM44/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05. 09. 23 15:51, Terry Hummel wrote:
> Hi Jaroslav. Thank you very much for your input.
> 
> I created the alsa-beep.conf file in the /etc/modprobe.d/ folder and rebooted. 
> When the system came up, I still couldn't get the speaker to make a sound via 
> the beep command. I attached the .conf file just in case you wanted to confirm 
> the contents.

Try to check mixer settings (Beep etc.) - e.g. `alsamixer -c 0` command.

If it does not help, run alsa-info.sh and show the URL with your dump.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

