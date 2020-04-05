Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64619E80E
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Apr 2020 02:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B10B1675;
	Sun,  5 Apr 2020 02:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B10B1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586045767;
	bh=XsaNolCaZBVyUG+KBfQnBWVS7hfzVJBB9BPeIFRSZZA=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Af3B6e4NlYeqSjCJFWE0lZScrpeDA6B31slnkEVx/QZZjK6y0naHGtvscQYdrbMUs
	 j4r7HsYGxL7eR9hLm4aB5ib44+DvmC9/wEhAah7LYIPh4VGdZDFHXgocuLJLiHMVOl
	 ptP9Xk3BKU7KfsHHdONXbbI+Sa88V92/8rIvIJLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BCB6F8014B;
	Sun,  5 Apr 2020 02:14:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE886F80148; Sun,  5 Apr 2020 02:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from smtp50.i.mail.ru (smtp50.i.mail.ru [94.100.177.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56F5DF800E4
 for <alsa-devel@alsa-project.org>; Sun,  5 Apr 2020 02:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56F5DF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru
 header.b="SD1eWoGn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:Message-ID:Subject:To:From:Date;
 bh=XsaNolCaZBVyUG+KBfQnBWVS7hfzVJBB9BPeIFRSZZA=; 
 b=SD1eWoGneZgGd3I5D7mKRhAXWsGXPBAeT4lcghTYzo0r8VRyXhcXXuCNwf8XJHjeiaIOWmGPOsRb76ye80SEUP51GFD45fpG0ehGcKjz7+XilW0C1Pk6JIAnDvrL/wazjLnCOXCwfu74b6EMjmy8e19XiDTwv2yfMVoA7dIDU6U=;
Received: by smtp50.i.mail.ru with esmtpa (envelope-from <dik_again@mail.ru>)
 id 1jKsvZ-0003b5-Sw
 for alsa-devel@alsa-project.org; Sun, 05 Apr 2020 03:14:18 +0300
Date: Sun, 5 Apr 2020 02:14:15 +0200
From: Ilya Dikariev <dik_again@mail.ru>
To: alsa-devel@alsa-project.org
Subject: Re: Re: [alsa-devel] Attempting to understand odd snd-usb-audio
 code 	and behavior
Message-ID: <20200405021415.0e7c3f44@rosh>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
In-Reply-To: <1542685.UGgiXn2nf5@kamdesktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp50.i.mail.ru; auth=pass smtp.auth=dik_again@mail.ru
 smtp.mailfrom=dik_again@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 0A44E481635329DB0E1AA8A03B392317D32E5E48865217365060145B739F5F5CB3409941E66BE95BF688BCB05C26794DEFCAE66BB52E0940F38AFC9AFD364C93CCFC12AB771BB5F5AF47D8741DF1C01B
X-7FA49CB5: 0D63561A33F958A56757D20F946F1724E230A141D2B3DA5C1C7F9336B170F7968941B15DA834481FA18204E546F3947CC2B5EEE3591E0D35F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458B4DA2F55E57A558BE7B076A6E789B0E975F5C1EE8F4F765FCE57DF924AC18EFA33AA81AA40904B5D9CF19DD082D7633A0BE77C518755DECA13AA81AA40904B5D98AA50765F79006374C1BB0B88D186EF3D81D268191BDAD3D18080C068C56568E156CCFE7AF13BCA4D5E8D9A59859A8B62CFFCC7B69C47339089D37D7C0E48F6C5571747095F342E857739F23D657EF2B6825BDBE14D8E7022B77CD34AB10DFFBBD9CCCA9EDD067B1EDA766A37F9254B7
X-D57D3AED: Y8kq8+OzVozcFQziTi/Zi1xwo7H2ZNxGP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSrVJwkVU7EwdgD/ql6jfy+t
X-Mailru-Internal-Actual: A:0.84421931288953
X-Mailru-Sender: A08E6F32C925F998D87D9657E2F21887126B7F11B1718BFDB2C4C4B4FC9B5C59B17BC84159881B6720D482E870A0767978274A4A9E9E44FD8BD5DEC50DDCA11CB2B5F6D720749F5467EA787935ED9F1B
X-Mras: Ok
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

Hey Keith!

I'm working with Roland R-26, and have pretty same problem here.
Was you able to solve yours?

WbR
Ilya
