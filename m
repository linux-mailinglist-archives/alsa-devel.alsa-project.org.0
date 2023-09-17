Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 129547A36F4
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Sep 2023 19:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86961E2;
	Sun, 17 Sep 2023 19:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86961E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694973152;
	bh=X5VCzkLDtXSGELcuDnEU7RoMTTqvoogEBre3WHO6Oe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cQqOTeqzM6aXAv8J9fI3dLcBLQgGRk+HcJ76RiyXvM2uBQwmOGJdX59A0qy8/tf/z
	 YAfqMUU4CJ9gEJIgUP/YebuLM3OQo4EbJ25E06JhkNl1GkNv3tevi5qlJ0fm/01aAf
	 1aZTIWbQTlvyurWXBXITw42t/itVcuwPDgz/Hm7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48FACF801F5; Sun, 17 Sep 2023 19:51:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDDAFF801D5;
	Sun, 17 Sep 2023 19:51:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9731EF801F5; Sun, 17 Sep 2023 19:51:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-213.mta0.migadu.com (out-213.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::d5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E62AF80125
	for <alsa-devel@alsa-project.org>; Sun, 17 Sep 2023 19:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E62AF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=POpXb36k
Date: Mon, 18 Sep 2023 03:46:06 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694973092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X5VCzkLDtXSGELcuDnEU7RoMTTqvoogEBre3WHO6Oe4=;
	b=POpXb36kq+DJyJrG0vdY/DNXzBnwQQvdNRgqGSB3eRhARVMVl1NUpzhs9sy5vsUoUO9Ztb
	IEJH6VqaBwOZBGLau3ZB7NwcPuCBfGNywbfVf2Bbp9ARvsK32zWZlJPK7fCIkDwrvB7zWU
	A9Bi9jPmQjXrD0KXvb/91pZfoE3p8qIyLghdXxSz2XwjO5tda2tSxgErFYajJNhCm98oQr
	BmPWQ9Ehv13cT+Suj80R3guDpJS7zOZTPCutteLzAcgL/UDFoOm3QNQ6R3ky7/udI1jsFs
	5mVi06C45DmQUiELdif0DP3KmVwGLOvddB7oizToeTkgzsZ2ZrXo5mGrcWzAgA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen
 property
Message-ID: <ZQc7XnrXX5VenYoX@titan>
References: <20230917173726.1916439-1-contact@jookia.org>
 <20230917173726.1916439-4-contact@jookia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917173726.1916439-4-contact@jookia.org>
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: X63JUKPOHWJHGKXD63M5MO6GNLZ63D4R
X-Message-ID-Hash: X63JUKPOHWJHGKXD63M5MO6GNLZ63D4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X63JUKPOHWJHGKXD63M5MO6GNLZ63D4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 03:37:26AM +1000, John Watts wrote:
> +Optional properties:
> +
> + - wlf,fsampen : FSAMPEN pin value, 0 for low, 1 for high, 2 for disconnected
> +

Uh-oh, I forgot to specify what it defaults to.
Should I reply to this patch with a fix or re-send the entire series after I get feedback?

John.
