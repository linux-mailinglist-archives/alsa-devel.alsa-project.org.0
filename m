Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B86367FBA77
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 13:48:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261CC83B;
	Tue, 28 Nov 2023 13:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261CC83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701175687;
	bh=wz5MmqLlCmnpuKdiwKhGrAWVXAILgZuTDZs8I6iusiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q7xE8AJEojqxWlHjCxGyuk7c4UxZc16ScDVEEi2bISKgeRtJ2IzN14FtDoCsegln0
	 tHYFNqEce8yPlSWdIdlZnBq1zYmt2BcTnyuQbhewxkx+FdpLiuXhS31szAZ4ULp6pE
	 6HEESkOPU4H77T+/mJ5OuM7vuYvpkqF9lNIx8JLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE423F8057C; Tue, 28 Nov 2023 13:47:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6016F80246;
	Tue, 28 Nov 2023 13:47:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B1F4F8016E; Tue, 28 Nov 2023 13:47:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5B76F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 13:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B76F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Forr+1Et
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F776CE1B05;
	Tue, 28 Nov 2023 12:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFEDC433C8;
	Tue, 28 Nov 2023 12:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701175641;
	bh=wz5MmqLlCmnpuKdiwKhGrAWVXAILgZuTDZs8I6iusiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Forr+1EtaGHgFMmidpddzg6MbnY60fpHgKg7FSe6soz+RILdnmcCQZzXDkTNgdfb3
	 YWmON4fXBNtD1WJ+g9ONKGzcBeP7zldQDe03W6ZmeRji0Ri2VPGf4igZrBhf16sVPl
	 p0nSNOhIVlkdCOgxSKjNSu5kPldrsrgxQfp9eyE/XqTkqGYq5bZcAJM2PhBbip5NwR
	 WdIAMpENriUAUmei7ELMI7etamRDe1xUIOlhWNPnlnV0TOPPN8eoIN7gNb2woAzfWc
	 TNYPdoKSVKy1OnGAO9tazOLtQkZ7ZQ+6ejpiVpfbSi+MA/W5zI3vBMmK4dOuHL8Z4h
	 A0A8nADfizGaA==
Date: Tue, 28 Nov 2023 12:47:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ASoC: codecs: Add WCD939x Soundwire slave driver
Message-ID: <ZWXhVvGWwXc27FHo@finisterre.sirena.org.uk>
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
 <ZV+PTynfbRmF0trU@finisterre.sirena.org.uk>
 <ee3baf94-4158-4440-8d89-de39fe0aa2f3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zRYJJGeNyjEN57NU"
Content-Disposition: inline
In-Reply-To: <ee3baf94-4158-4440-8d89-de39fe0aa2f3@linaro.org>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: VCCCYCJLNBH5AUVBKQNWOUEQXKXYVHKR
X-Message-ID-Hash: VCCCYCJLNBH5AUVBKQNWOUEQXKXYVHKR
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCCCYCJLNBH5AUVBKQNWOUEQXKXYVHKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zRYJJGeNyjEN57NU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 28, 2023 at 10:09:29AM +0100, Neil Armstrong wrote:
> On 23/11/2023 18:43, Mark Brown wrote:

> > > +static int wcd9390_interrupt_callback(struct sdw_slave *slave,
> > > +				      struct sdw_slave_intr_status *status)
> > > +{
> > > +	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
> > > +	struct irq_domain *slave_irq = wcd->slave_irq;
> > > +	u32 sts1, sts2, sts3;
> > > +
> > > +	do {
> > > +		handle_nested_irq(irq_find_mapping(slave_irq, 0));
> > > +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_0, &sts1);
> > > +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_1, &sts2);
> > > +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_2, &sts3);
> > > +
> > > +	} while (sts1 || sts2 || sts3);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}

> > We do this in the other Qualcomm drivers but it doesn't seem ideal to
> > just ignore the interrupts.

> It seems we simply ignore IRQs that are not mapped in the regmap_irq,
> what would be the ideal way to handle this ?

I don't understnad what "this" is here.  Why even register an interrupt
handler here?  What is the regmap_irq you are referring to here and why
would an interrupt handler here be related to it?

> > > +static int wcd939x_sdw_component_bind(struct device *dev, struct device *master,
> > > +				      void *data)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +static void wcd939x_sdw_component_unbind(struct device *dev,
> > > +					 struct device *master, void *data)
> > > +{
> > > +}
> > > +
> > > +static const struct component_ops wcd939x_sdw_component_ops = {
> > > +	.bind = wcd939x_sdw_component_bind,
> > > +	.unbind = wcd939x_sdw_component_unbind,
> > > +};

> > Do these need to be provided if they can legitimately be empty?

> AFAIK yes, component code will crash if those are not defined.
> I'll add a comment explaining whey they are no-op.

If the framework can genuninely have empty callbacks here the framework
should be updated to make the callbacks optional.

--zRYJJGeNyjEN57NU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVl4VUACgkQJNaLcl1U
h9CQFAf/X86BJjWyIuWFGa/imsTVc1qRNOaSfXiSo5tUqzDx+dmeJZ0iDSexp52n
+s6hQKvWt8aXarV/rAUIIM8yemaz2BMINAZQQxW5Qm0IpNH82u9AFczWvx9fK8AG
ISjnkn5P+MEhqTHfB54ZNcdT11C9KPgo0kP5eMIsRNJxVPahElMgde866TSK7P3Q
VYrYF+xKYHaoHR5kIC4lgHgbzVpaa2O9nbuur28vCX5HHg7Mv9y2ia1X2R+qLKrp
yuB/5lBeGaFidOuZdoz8KqxsI9e4Z4aqzKGsMBVV7i966MiEX2cHfcEq0qC8y6QN
dndVngDVmPkbhT/RFYsA7yCD2uRfxA==
=P7CZ
-----END PGP SIGNATURE-----

--zRYJJGeNyjEN57NU--
