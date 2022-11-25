Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17809638998
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 13:20:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913901739;
	Fri, 25 Nov 2022 13:19:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913901739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669378809;
	bh=mZOp0vsvzRrNngwKyz7HgmROJmugzd6BQQN4kzDGk24=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2mePVOlgxnuHsxmG1T7OMvIPF1BWEyIu7gUXJRYeZ6BwtpSqz7tX7fN7bYF9aerQ
	 QR2d/S0hGzxJp7Yf9hZbvLldapadQZ9KDkAs96AuK2YytnRVusPstPaoKEezTrSvb4
	 QIWWjDIp1+YMyBuLZbLpedGpRY8U3jWD2/npAXJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1B4F800B6;
	Fri, 25 Nov 2022 13:19:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E79EF80236; Fri, 25 Nov 2022 13:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2091AF800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 13:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2091AF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G5wlKNyl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D647B82985;
 Fri, 25 Nov 2022 12:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DE8C433B5;
 Fri, 25 Nov 2022 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669378748;
 bh=mZOp0vsvzRrNngwKyz7HgmROJmugzd6BQQN4kzDGk24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G5wlKNylGWwR6ccZnV/INSMAmpV0EY9BkrXiiJe/AQR0G5sNqfMBGGACQyjqJUA91
 WQQJpKRH91kDEgfcIP8P1MnpMeDgzSLbZ1m3fc/5nqmVx0NrTQw0WCIm2PQPLCG26Z
 bsYrl4UMvlHkFGB41Lqgs2Z/Dy9okY7qAotKMH1vvBDGSx2LTUaF3I0ieN7VTwWHx2
 i1Nw+hxV+2g6R0dw44LxzAs+X8zw2uppIAi+zggmEC4W8zMX8dt1Qc7ZcrQtiuCYSw
 zqJ6lKysbpar/wNHQoF2+hoBADLgTFJe/JEu5P+dHV8n+OwVcGTsc48biZoyqRl6tM
 P8Cq6ZRKhRidA==
Date: Fri, 25 Nov 2022 12:18:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y4Cysgk5Gic5ae9B@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kNT+QONpsQiODP63"
Content-Disposition: inline
In-Reply-To: <20221125094413.4940-2-jiaxin.yu@mediatek.com>
X-Cookie: Time and tide wait for no man.
Cc: neil.armstrong@linaro.org, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com,
 kuninori.morimoto.gx@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, allen-kh.cheng@mediatek.com,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--kNT+QONpsQiODP63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2022 at 05:44:11PM +0800, Jiaxin Yu wrote:

> +	/*
> +	 * PCM trigger callback.
> +	 * Mandatory
> +	 */
> +	int (*trigger)(struct device *dev, int cmd);
> +

Making this mandatory would break all existing users, though...

> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (hcp->hcd.ops->trigger)
> +			hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_START);

...it's not actually mandatory so it's just the comment that's wrong.
I'm a little unclear why this is being implemented as a DAPM operation
rather than having the driver forward the PCM trigger op if it's needed?
Or alternatively if a DAPM callback is needed why not provide one
directly rather than hooking into the trigger function - that's going to
be called out of sequence with the rest of DAPM and be potentially
confusing given the very different environments that trigger and DAPM
operations run in.  A quick glance at the it6505 driver suggests it'd be
happier with a DAPM callback.

--kNT+QONpsQiODP63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOAsrEACgkQJNaLcl1U
h9CCdgf+JzEvQcOa+cudwzO1Ok98aky4qGZCuKQnnWtkrCayv8eiu7wd7w5G9dpU
VciYfLQ8bgQ3UOImbANerH2+FJhMtldcF8Vn5FJCG1eXpJGMRbWrjguA15/n88uT
bQ2wEInMii6ecKtSyULg3ie9tuLseZfS3jJHOwJeYFANRmaef0UUAQyPkHnnVsj8
luaShk6424tDgSWY1es5RVtOOzPH/JpBXK1DKuCEBI7DFYuAJtmqgXXIZvfwNPHe
sCV/N6DVZNU152PRSiyAX3Y8/x3NzYiSs6BXexv10OlCq44sCPYZ+HdbgY7qQL4y
w7JwiNOcmvN0sbAhK0jjSKmJ3/spKw==
=ReC2
-----END PGP SIGNATURE-----

--kNT+QONpsQiODP63--
