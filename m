Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DDD7A1599
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 07:43:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E107C84B;
	Fri, 15 Sep 2023 07:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E107C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694756605;
	bh=cCM3351WRdV6tVhq+BNSXK1D16VOR98tLWYlqsnRpDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D1G0Kkivp30J0rEP3aEHOoJ4jaOq07qtIDwQu85v2VwBWmRxS+mSNj3X9+22a3edf
	 IrcFw6j//0bBH8Td/Wcckl4nD5btC0iMdQOTNUVLhxl9zPqiQzxU/vVjr1+dKR56HA
	 jGU8+UFESuihnpfJMwo7Gt0bCYVQ/5YeVYwlHoxQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32FFBF80552; Fri, 15 Sep 2023 07:42:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F2FF80246;
	Fri, 15 Sep 2023 07:42:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E65F80425; Fri, 15 Sep 2023 07:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-229.mta1.migadu.com (out-229.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49931F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 07:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49931F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=u9eOnFw7
Date: Fri, 15 Sep 2023 15:39:49 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694756471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCM3351WRdV6tVhq+BNSXK1D16VOR98tLWYlqsnRpDw=;
	b=u9eOnFw7G6nV8I4pyPcyYq5WTp+JJAn8sNstU2xz4zKQD9wNpeQPxcZ1wpS4NOu6dZGHPf
	qJgWrd3KczX9vFViCBZznRYceLqxrcfis/ccPHeucCwJX1BEeL5ffVWz3oNAMb4y6Kn7ab
	5J5J4XLFa7egL93YEc1z7G8xRQQjMziXepYYDPtgUn/Tk2K5Q+veeAYrALzbMk8ke03wFc
	22YaADVRIp2w6Qy6D3KyxGbWbwxbYCQkYcaBbVPnj5qm8Bb9TGr21SkPAKJLWg38ykDJpD
	QQXqBtr8brPT+rVOBC4wX6aQRllOlhRq+4XGqH6y+Kt0ZGhxn2eL8flZzrbR/Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen
 property
Message-ID: <ZQPuJXcmHABQFaQl@titan>
References: <20230913171552.92252-1-contact@jookia.org>
 <20230913171552.92252-4-contact@jookia.org>
 <20230914145234.GA1275176-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914145234.GA1275176-robh@kernel.org>
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: K65LGWPSZSZSUSFWUZZUQ5UBLLE4ZG6B
X-Message-ID-Hash: K65LGWPSZSZSUSFWUZZUQ5UBLLE4ZG6B
X-MailFrom: contact@jookia.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K65LGWPSZSZSUSFWUZZUQ5UBLLE4ZG6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 14, 2023 at 09:52:34AM -0500, Rob Herring wrote:
> What's the default if the property is not present?

0. Should I specify it here?

John.
