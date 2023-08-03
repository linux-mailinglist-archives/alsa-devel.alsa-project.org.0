Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FB76DFE0
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 07:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE73E3E7;
	Thu,  3 Aug 2023 07:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE73E3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691041759;
	bh=QCbdb5nqq9/Q+NILtUZslBccjeyrNUyVXQqeJ0eLu6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BpBL0rUBEqIEMqMxPAtOr97iEW2DpBAKHQ9q5zXe/AlwrzNJyrd7SZWbDo03hvdn0
	 rSRDCg9PvEWaTdb+kNsDIFsvV30uZgvgmTEMm6C8GivcQZ3UZrQK0tKS3gopzCxbrZ
	 pwtlfNckUTkGtMGQpBBWd3UN83LIBn4czydWs2ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85F4CF80087; Thu,  3 Aug 2023 07:48:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B418F801D5;
	Thu,  3 Aug 2023 07:48:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FEA8F8025A; Thu,  3 Aug 2023 07:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2439DF80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 07:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2439DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=HA+b8qTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=zIW/y+DcvZO+CvMHMjs75CtPARmm1smITFzSh+LOpxs=;
	t=1691041695;x=1691131695;
	b=HA+b8qTPOk+KQTIH0Y0ki/nvnZYdYac4UiJnFljs+EDVcD5dA3x56r5ntuDvesDAEwiB9p3tEu6tnzx0ErgNHJgImj4d3k2RvEeLxdtKEzuTVfYKDqcmo8YMnbBEsL9aIX3vT/wq08VSx8tYUraTa3CwNczI4ZwbbV0Q8V2zcIeGZC/3I2z9JqpR4mvUCXiAl8qrLlTbpuAk/6MiWxO1GBec2zQlc82ncIMK4yVMcUeeHI7/WkCj/eSvuC/c1v6i4i4Bz0lzsWa4tmp+dToI/FDx4yh0tC5RNahYQeSm86h4xlKDpj3m1cSsXm6QaHF/uYl3BppmkJgDakOFu+6OUw==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qRRBz-0005e1-Aq; Thu, 03 Aug 2023 08:48:11 +0300
Message-ID: <4f747185-6405-4cb6-f13c-de6572d2de8b@inbox.ru>
Date: Thu, 3 Aug 2023 08:48:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/38] ASoC: dwc: merge DAI call back functions into ops
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
 <871qgmuuxh.wl-kuninori.morimoto.gx@renesas.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <871qgmuuxh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 
 4F1203BC0FB41BD93761F2630DFFAF419FF9F365118383038215B45E24F6DA4B182A05F5380850404D9AAD3B3EA41D30BDD71ED413A97C8B5117B211968D06512D88ADF15DDE9D0B
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F65C230EDDCD559EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063719899BAB9B61B3948638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B3261CC6E7B0E7206C75D2C9D2B734D06F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF84B8A2F7AA0758EA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A5FDB2A64A0E74FA12E8381109C961419A6BECBE6364FED422F87CCE6106E1FC07E67D4AC08A07B9B097AD43380FEE24CACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFDFCE4C978A89768FBC35DD08E6EC7318CF2794AE7094001A0F4C06C458A803F60070534DE2CB11AA8553022043D0BC9AE85B4519C576127626DF6773F9476B9C7188EE918FF98BD002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojcir52QaMQ81f8/l6lQPlFw==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B865B60082A36ACD934426546732CA16098CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: NKEJJLVPVT6WGZ33XD4VJFUWQEP6WXQF
X-Message-ID-Hash: NKEJJLVPVT6WGZ33XD4VJFUWQEP6WXQF
X-MailFrom: fido_max@inbox.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKEJJLVPVT6WGZ33XD4VJFUWQEP6WXQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 02.08.2023 03:52, Kuninori Morimoto wrote:
> ALSA SoC merges DAI call backs into .ops.
> This patch merge thesse into one.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

