Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE787B0792
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 17:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98CC9F6;
	Wed, 27 Sep 2023 17:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98CC9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695827014;
	bh=r8NJqB+Eskoh9K1MkrQnG5srH7gWNZFeblzEWCKg2ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r/s27Z2w02Lh8GWnBD2KBURJk8YMykYX+M+opl49wPb2MUX5NQA6N3vUUc/kmN77b
	 GpLgKav2UT1BGOuMust3+7TN2Qf1HyexmgzhEv1SRzfGx51Aem9VBIRknkEqOqSdYv
	 Tkxp61QVhPxkpoZFOctZ7+5jppvJYtFDhvqijgzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CEE8F80558; Wed, 27 Sep 2023 17:02:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41ED7F8007C;
	Wed, 27 Sep 2023 17:02:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A85DF8016A; Wed, 27 Sep 2023 17:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12FCCF80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 17:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12FCCF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dF1x9v6F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD394CE1A8F;
	Wed, 27 Sep 2023 15:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96E6C433C7;
	Wed, 27 Sep 2023 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695826933;
	bh=r8NJqB+Eskoh9K1MkrQnG5srH7gWNZFeblzEWCKg2ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dF1x9v6FR31R1fdTryZ3/4xKYsKnyb5iunoYG4CVwJ5i098D+gDiHo3u6uZUhAdvJ
	 cTpvMuST3Lli3Py9ecOWHMbwtisIuicQUhgBopTU+JRcNTLvwb6W4B3QU/feEoCv9p
	 GnMUkhO9AnInoB761J+f21N+VBhkhCReHrcZGtBTEcnK+THjD7jl6/aIGC15LTh6aZ
	 spJ6J/R4Em4Un+nyAsTkdvEN+QY/OeXE4e9ASC1RrsIUHff6I8dH1C9kghGG5Zpmku
	 5+zl8WSbP69JzRtaq457YiCW3w25jxluEN+Se+Y920RqssBM9dBkqYzDkcPamot36G
	 UgZPe2sXHMamw==
Date: Wed, 27 Sep 2023 17:02:09 +0200
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 29/33] ASoC: qcom: qdsp6: Add SND kcontrol for
 fetching offload status
Message-ID: <ZRRD8eFZugh/+dex@finisterre.sirena.org.uk>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-30-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2qid1YG4vVF/Hdr6"
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-30-quic_wcheng@quicinc.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: 63O2A3WV5RN2ALUN66FVC3BW65JTYVSQ
X-Message-ID-Hash: 63O2A3WV5RN2ALUN66FVC3BW65JTYVSQ
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63O2A3WV5RN2ALUN66FVC3BW65JTYVSQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2qid1YG4vVF/Hdr6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 02:48:39PM -0700, Wesley Cheng wrote:

> Add a kcontrol to the platform sound card to fetch the current offload
> status.  This can allow for userspace to ensure/check which USB SND
> resources are actually busy versus having to attempt opening the USB SND
> devices, which will result in an error if offloading is active.

> +static int q6usb_prepare(struct snd_pcm_substream *substream,
> +               struct snd_soc_dai *dai)
> +{
> +       struct q6usb_port_data *data =3D dev_get_drvdata(dai->dev);
> +=20
> +       mutex_lock(&data->mutex);
> +       data->status[data->sel_card_idx].running =3D true;
> +       mutex_unlock(&data->mutex);

These updates of running should really have a snd_ctl_notify() so that
UIs can know to update when the value changes while they're open.

> +static int q6usb_mixer_get_offload_status(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{

> +	running =3D q6usb_find_running(data);
> +	if (running < 0) {
> +		card_idx =3D -1;
> +		pcm_idx =3D -1;
> +	} else {
> +		card_idx =3D running;
> +		pcm_idx =3D data->status[running].pcm_index;
> +	}
> +
> +	ucontrol->value.integer.value[0] =3D card_idx;
> +	ucontrol->value.integer.value[1] =3D pcm_idx;

This feels a bit messy but I'm not sure what we'd do that's better so
unless someone else has better ideas let's go with this.  Possibly we
should standardise this as a new control type for joining cards up so at
least if there's further needs for this we can use the same solution?

--2qid1YG4vVF/Hdr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUUQ+0ACgkQJNaLcl1U
h9Bd4gf/SmW7ryUa29e71/V9HuX7Jew2MdnRQDuXz6STFyi1WM6tcjFJSRGg0qG4
+JqN2fHT/gRP7Bflr/Bn+DVjr4ms8Rp0KS98kfKk4gHHoJr+Y7yDROhNJ3gMUxP7
V7c/ZtQoP32PyNcM8K2x48fbOm1PBkZS8ch/BRzaIV0Jswv9aArfeP30ApjrIZb+
tG7/Qrgeyao2F7u4J4wd74HaFKdp0HXk3csDcXlZ8bqit2/zx5de1UBVnmHzRaVS
g0dubyNXyFQVTJRYfAphnLkmg7T7Cknn17SxaEmlkfMTKoS6kXB+t04e3NsyvuvM
Tt1rVGB3hzwIPa1u8VT5/HgysV7eFQ==
=JgtR
-----END PGP SIGNATURE-----

--2qid1YG4vVF/Hdr6--
