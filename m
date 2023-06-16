Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C24B733B21
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 22:43:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE9DE827;
	Fri, 16 Jun 2023 22:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE9DE827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686948234;
	bh=T3+Q1m60/nFd2R+tMFiJtuLhqjcPjNdeMf2banobDew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G9mOjmUer9Ss0ia1H6rPZn+uOZK+LBgFrXXgGNK09iQtjE5vL3kOgmfwyH/JaPg1x
	 06Qx8A/XsiP7qBmkDpeof9Zi+S8KoEEYhzbY3nOtIiDd/XUxeW99wbNLKxk/B3wiDY
	 OwzzlC9noQm3HOtex4/DWlXb8CezCcuG3D9jT3Ys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F4A7F800BA; Fri, 16 Jun 2023 22:42:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0952F80132;
	Fri, 16 Jun 2023 22:42:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C92A5F80149; Fri, 16 Jun 2023 22:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84C9AF800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 22:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C9AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=HhzDn1f9
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B45BD80375;
	Fri, 16 Jun 2023 22:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1686948168;
	bh=a30SPrRPmvQkaTpaJvJdtMPmRuSKSp3jYsMkerwDdCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HhzDn1f91jSrU0N/vjWvDrqlvqMkSkKKyocj1/IhuNPiDXkOdmu6SXpDJet4ZfNT9
	 rAflFWBKt8r04lNL5VFI6PvqyTYkZYlI01K2H2pusUZWgAKK1pqEPBJVZcRNZCLjh3
	 ryw83Ww7T7abW61vsC+MX9J4n13bOaHQVfe3nX/JUZUQvU2M6QkT0DiYu4ULhlMfRX
	 4/jv4TWrel9C0XriFxF/O6SJUA8ejdUYnN6KBqQTXX/y7ZnOCJHZWYPGlA2xnPkU8C
	 BptnVYLRWbKd1j3v/KmoQhbhsaThTxc5ffvOb7mto3NLtX6L1dzaYSGTrWgtxCQIW8
	 cuEmypputJvgQ==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 16 Jun 2023 17:42:48 -0300
From: Fabio Estevam <festevam@denx.de>
To: shengjiu.wang@gmail.com, broonie@kernel.org, daniel.baluta@gmail.com
Cc: alsa-devel@alsa-project.org
Subject: Re: imx8mn: Trying to get EASRC to work
In-Reply-To: <87d11267e2d93256e071ee7d86775cc7@denx.de>
References: <87d11267e2d93256e071ee7d86775cc7@denx.de>
Message-ID: <2f487267680da4e45daf1ae4587cc206@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: JPUDNNDP7SIQAHI672Q3IES7ALCRK34S
X-Message-ID-Hash: JPUDNNDP7SIQAHI672Q3IES7ALCRK34S
X-MailFrom: festevam@denx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPUDNNDP7SIQAHI672Q3IES7ALCRK34S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/06/2023 16:39, Fabio Estevam wrote:
> Hi,
> 
> I am working on an imx8mn-based board with an ES9080 codec and I am
> trying to get
> EASCR to work. (The ES9080 driver is not upstreamed yet).
> 
> Audio playback works fine via simple-audio-card and here are my changes 
> to
> get EASRC to work:
> 
> 
> -	sound-ess {
> -		compatible = "simple-audio-card";
> -		simple-audio-card,name = "ess-audio";
> -		simple-audio-card,format = "left_j";
> -		simple-audio-card,frame-master = <&s2cpu>;
> -		simple-audio-card,bitclock-master = <&s2cpu>;
> -
> -		s2cpu: simple-audio-card,cpu {
> -			sound-dai = <&sai2>;
> -			dai-tdm-slot-num = <8>;

fsl-asoc-card does not take the number of slots into account.

I have sent a patch adding support for it.

Now I can get audio output and will be running more tests.

Thanks
