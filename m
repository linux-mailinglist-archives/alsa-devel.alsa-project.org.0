Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 532D77B45B2
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Oct 2023 08:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E7A868;
	Sun,  1 Oct 2023 08:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E7A868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696143222;
	bh=GM/mYUuOmGzH9msPh1JVpT3moimj5p1tCf3oa46+mxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LXuWcR6DVsfsMablRkjZx25bQX3jhbXEFhKkNKm/oM4PsnTPsb/1XblWRUdzbw2z7
	 df2Cxjmk1h3rs1s+B0Ie9NYpVkiNc1G1nHZaJs8jeZYNJURk25jtZqXPKp9T9F9ky9
	 w+NSiYAIT4y3RxZW2xFMVdLR+SZYzKjW24Fkmvtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC2C6F80551; Sun,  1 Oct 2023 08:52:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3AF9F802E8;
	Sun,  1 Oct 2023 08:52:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A3CF80310; Sun,  1 Oct 2023 08:51:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from omta034.useast.a.cloudfilter.net
 (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E280F801EB
	for <alsa-devel@alsa-project.org>; Sun,  1 Oct 2023 08:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E280F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=ARs6TH7D
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTP
	id mm5tqFeHIIBlVmqIOqitUl; Sun, 01 Oct 2023 06:51:16 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id mqInqlm8C0dhwmqInq3Euf; Sun, 01 Oct 2023 06:51:42 +0000
X-Authority-Analysis: v=2.4 cv=VNzOIvDX c=1 sm=1 tr=0 ts=651916fe
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=E-DQCdINAI_ro2gpc_8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RQoLaawxxP4kcl3hGbY+UlKaUKWuunzhdx1htbHC0Us=; b=ARs6TH7DJ7eOprEYGqnHXt2Ac7
	SnY19R2fecsH2JZFhQq/eRTuL5MEeaQ29VfuF4f7LV2joPIePtjwFxW3f27EYaSP7IHXSuVo77tUL
	t6H7yezBDovYf7MLzhJ4YEYqvFYHDXgdQLrVz12pJI2P9bAb1lTATpC2ziMbrM8SRrj/B+wKeM4ZL
	r/RGm2b0A/vFAm1DILejcHjnfEMAdG/6vtjz7FOv6oq+UIQXflNjWk3AtZw6rw9X5GIHXA72JSkqP
	hBwfqE+HrCAFr/gBCJuKY778T3noqhwV2+zOPl56abVKBvv8mpv2Gphql3Duo4iVJLP1Nippd0Bqr
	CxdTtcvg==;
Received: from [94.239.20.48] (port=34310 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qmqIm-001UlA-0h;
	Sun, 01 Oct 2023 01:51:41 -0500
Message-ID: <933c901f-ff4f-2769-6277-b63b96903034@embeddedor.com>
Date: Sun, 1 Oct 2023 08:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH][next] ALSA: 6fire: Fix undefined behavior bug in struct
 comm_runtime
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZRb0WiViajjqcyKT@work> <202309291024.14F6DA0@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202309291024.14F6DA0@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qmqIm-001UlA-0h
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:34310
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 95
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfIx1KsZtDsBIwCin173d6hNInVHJRgg06aFlGspibjylAwyqVb3C+j2PTvWU9VKnTgk89Rki1bJenjn44IblDL3cG9IUCyyPZsIyFcH47vjTqjIoMWMT
 PNNXVzvZeLVZjhqzeg4lX+sY1HO5XrOL3+F6unDnijHUK+QLd6Vf+sSs0mBQ37lMA/9qq+B4ghE/7EVnZhflp/zpORlLfFnCD4nceGwM9jRkkYniwav7Xu3s
Message-ID-Hash: FDJJPKAJNF5OKOLRZY3KCLXLL54XKIJO
X-Message-ID-Hash: FDJJPKAJNF5OKOLRZY3KCLXLL54XKIJO
X-MailFrom: gustavo@embeddedor.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDJJPKAJNF5OKOLRZY3KCLXLL54XKIJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/29/23 19:26, Kees Cook wrote:
> On Fri, Sep 29, 2023 at 05:59:22PM +0200, Gustavo A. R. Silva wrote:
>> `struct urb` is a flexible structure, which means that it contains a
>> flexible-array member at the bottom. This could potentially lead to an
>> overwrite of the objects following `receiver` in `struct comm_runtime`,
>> among them some function pointers.
>>
>> Fix this by placing the declaration of object `receiver` at the end of
>> `struct comm_runtime`.
>>
>> Fixes: ddb6b5a96437 ("ALSA: 6fire: fix DMA issues with URB transfer_buffer usage")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Should these mention -Wflex-array-member-not-at-end ?

Probably, yes. I wasn't sure about mentioning it because it's not been released yet.

> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

Thanks!
--
Gustavo
