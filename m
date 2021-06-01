Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C40396DBD
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 09:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AE416AA;
	Tue,  1 Jun 2021 09:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AE416AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622531123;
	bh=IqnALKQrluYnFxmvbKkDfq5XADhhjTnt3+1v4V0ski8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rmieeESh7J4sI0c+BtmYtMp9TlzAdwmdX2bVJhCacIYDGFpWPiUiPw1Ew6mXFW192
	 JaO4VXZHHcQiPmXrGRUDWE/k+AHkTqepwpzpYoqlmxOAByRMsMsawHnWho+Gk1NRwN
	 j1PrYMthMie+IIoG0/e9/pI22CfVt9F//YJpKSKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C016F80254;
	Tue,  1 Jun 2021 09:04:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9076CF80269; Tue,  1 Jun 2021 09:04:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from ns.pmeerw.net (ns.pmeerw.net [IPv6:2001:1b60:2:23:1033:103:0:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6443F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 09:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6443F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pmeerw.net header.i=@pmeerw.net
 header.b="KyeNM0G5"
Received: by ns.pmeerw.net (Postfix, from userid 1000)
 id 19464E03CB; Tue,  1 Jun 2021 09:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pmeerw.net; s=mail;
 t=1622531055; bh=x3pkr3Hx3QyIaRkLApcucMsusU6XWTAz8PyYhDdA/bI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KyeNM0G5a1YNSyFBA3NZSD6r61Zh31S24Y8y+AQCFiGtpTgwZZ8UpRccgZhxBEgxu
 E/0q37hmrRktGtzjg1KOnbigZhBpc6u4loyHXZnAt7Lf2kDcn1lmm88fGTMNWsPGg8
 2BYhZ93OrGF/giAFuXwAvHZ7sYdtKFWVB0l/qrbs=
Received: from localhost (localhost [127.0.0.1])
 by ns.pmeerw.net (Postfix) with ESMTP id 0C516E0219;
 Tue,  1 Jun 2021 09:04:15 +0200 (CEST)
Date: Tue, 1 Jun 2021 09:04:15 +0200 (CEST)
From: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
To: josef radinger <cheese@nosuchhost.net>
Subject: Re: trivial patch
In-Reply-To: <05170bbaeea7eb6d5a4439e4884665a29bb2a144.camel@nosuchhost.net>
Message-ID: <9b1b36d-aa1-182a-c140-40f2915778c6@pmeerw.net>
References: <05170bbaeea7eb6d5a4439e4884665a29bb2a144.camel@nosuchhost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, trivial@kernel.org, tiwai@suse.com
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

On Sun, 30 May 2021, josef radinger wrote:

> just fix some trivial typo in comments, sorry for the second try. 
> i should have read more carefully the rule about NOT sending attachments.
> 
> diff --git a/sound/soc/qcom/qdsp6/q6adm.c
> b/sound/soc/qcom/qdsp6/q6adm.c
> index 3c68df82c95c..1855b805eba2 100644
> --- a/sound/soc/qcom/qdsp6/q6adm.c
> +++ b/sound/soc/qcom/qdsp6/q6adm.c
> @@ -373,7 +373,7 @@ static int q6adm_device_open(struct q6adm *adm,
> struct q6copp *copp,
>   * @rate: rate at which copp is required.
>   * @channel_mode: channel mode
>   * @topology: adm topology id
> - * @perf_mode: performance mode.
> + * @perf_mode: performace mode.

that appears to be backwards, no?

>   * @bit_width: audio sample bit width
>   * @app_type: Application type.
>   * @acdb_id: ACDB id
> @@ -452,7 +452,7 @@ EXPORT_SYMBOL_GPL(q6adm_get_copp_id);
>   * @dev: Pointer to adm child device.
>   * @path: playback or capture path.
>   * @payload_map: map between session id and afe ports.
> - * @perf_mode: Performance mode.
> + * @perf_mode: Performace mode.
>   *
>   * Return: Will be an negative on error or a zero on success.
>   */
> 
> 
> 
> yours
> josef
> 
> 

-- 

Peter Meerwald-Stadler
Mobile: +43 664 24 44 418
