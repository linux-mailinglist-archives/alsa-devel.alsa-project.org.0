Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6884C839
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 11:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC4C846;
	Wed,  7 Feb 2024 11:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC4C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707300229;
	bh=xm7xuHD7FhQxqr7dC2MoC3iL32A8DBYzQX6XTWNEL9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DT77SMTxorCiqcHqa8SbMKYC37FAE+skfFPFvf8fOMf6AQTDpuaMUNnynmYtx44vj
	 e+4Hjjszceo06bQYU/suzBr2552lNxEOkCR0ZjVwee9ZSpVzqp9GSSl0YyZ3hs2sB/
	 HgbFmL16fhsk15nI935Krke/lL5nXT4szuZLsWF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 921ACF8058C; Wed,  7 Feb 2024 11:03:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 276D6F80568;
	Wed,  7 Feb 2024 11:03:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07514F801EB; Wed,  7 Feb 2024 11:03:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACD26F8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 11:03:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACD26F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=f8jUNJwC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B3023CE1881;
	Wed,  7 Feb 2024 10:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F51CC433C7;
	Wed,  7 Feb 2024 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707300177;
	bh=xm7xuHD7FhQxqr7dC2MoC3iL32A8DBYzQX6XTWNEL9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8jUNJwC1R+El/P1zoYEmOeoEiJ2b9Eqf/BEaT4yq3EVbwEue0Q9kDh77V77kFcDt
	 g4V5NW1/h1PlYEviLtlfd3uNSJGvs5IEPU5rmXx2dIiRr58pb7DJR/kkFcW1UlC566
	 DZBMOHOEzj9ivmOyuG3ZVSX9An3fETIYiVrgGoho=
Date: Wed, 7 Feb 2024 10:02:54 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2781: remove unused acpi_subysystem_id
Message-ID: <2024020745-freight-slush-9ae7@gregkh>
References: 
 <df5c94396256e9573b772962182def52d20c50d4.1707250969.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <df5c94396256e9573b772962182def52d20c50d4.1707250969.git.soyer@irl.hu>
Message-ID-Hash: P5M5ESNNRLDJCLUFG6M46INN4NKSKOX7
X-Message-ID-Hash: P5M5ESNNRLDJCLUFG6M46INN4NKSKOX7
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5M5ESNNRLDJCLUFG6M46INN4NKSKOX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 06, 2024 at 09:25:50PM +0100, Gergo Koteles wrote:
> The acpi_subysystem_id is only written and freed, not read, so
> unnecessary.
> 
> Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")

What does this really "fix"?  It's just a cleanup.

> CC: stable@vger.kernel.org

Again, what bug is this fixing?

Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
about what should be tagged for stable kernels, which this patch series
does not seem to fix.

thanks,

greg k-h
