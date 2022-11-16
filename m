Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD262C25E
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 16:22:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A94A15CC;
	Wed, 16 Nov 2022 16:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A94A15CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668612136;
	bh=rkl74hjZiMYxuJZWqGhNUqwpU5oKOCcV1GkA2HnQeKk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XgblwbzJzbKlE+YpL9/jL0zb6Ik/ocRKCCUERRllP9lRfF3fplAnIN2LOWpP96hKR
	 a+uD4Q39+BMrphlgYQS5trS+BbtSppb20Ivqga2Ory6jwgOGB4eD+H5BakrO9C+cbU
	 cE90sMsKfqQ1qpu1Q9rBjAQBnVtx56GhRvRHhc7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CD9F80238;
	Wed, 16 Nov 2022 16:21:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58727F80169; Wed, 16 Nov 2022 16:21:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F521F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 16:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F521F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kX8Jcxtn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7884A61E68;
 Wed, 16 Nov 2022 15:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7981AC433D6;
 Wed, 16 Nov 2022 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668612073;
 bh=rkl74hjZiMYxuJZWqGhNUqwpU5oKOCcV1GkA2HnQeKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kX8JcxtnknR4KClPEnZ0dMcQnbUPwiLTmEI+dcdyFq9X4B5K/LI8I0Z1i/fZNWegt
 g1g620dbA4yibfObcBpWwqOHkN+Pngl2RQe+H64++AUeeSi3YsEjsZoa0WCRX9igpy
 +ddlH+L7mzVh+mSQTBFXHA8nDyZaY//qMWvNssTTluBj4qk598nFhwGI5KaWX5MA0H
 mrVPKduHLuVlfAx/FyCPbkyjuf+JMSmFPTJSn6f8sU9NtTXbDTklC/FL7A4FHqVxcn
 Cp584vf7PeaviDLMSZETyw3McM9vLyRbnnxKC078n2zzNzZvDV3qJU/WK3+HjdgEY5
 OgKdjdkDYL0Zg==
Date: Wed, 16 Nov 2022 15:21:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Message-ID: <Y3T/5iOcbibtJUn5@sirena.org.uk>
References: <20220921044405.4441-1-kiseok.jo@irondevice.com>
 <20220921044405.4441-2-kiseok.jo@irondevice.com>
 <5be08dad-271a-a804-0093-8734d81ac6c6@linux.intel.com>
 <SLXP216MB0077606A485A1E0B6F5416308C579@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Tn5/Y3Bz1oT0rks3"
Content-Disposition: inline
In-Reply-To: <SLXP216MB0077606A485A1E0B6F5416308C579@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Ego sum ens omnipotens.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Gyu-Hwa Park <gyuhwa.park@irondevice.com>,
 Application <application@irondevice.com>
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


--Tn5/Y3Bz1oT0rks3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 29, 2022 at 05:47:41AM +0000, Ki-Seok Jo wrote:

> >> + * Copyright 2022 Iron Device Corporation

> > Missing Copyright (c) ?

> I don't know this part exactly, so when I looked it up.
> Most of them use a mix of two cases. Which would be better? Using Symbol or not?

The (c) is meaningless, what you have is fine.

> >> +	val = (u8 *)ucontrol->value.bytes.data;
> >> +	for (i = 0; i < params->max; i++) {
> >> +		ret = regmap_read(sma1303->regmap, reg + i, &reg_val);
> >> +		if (ret < 0) {
> >> +			dev_err(component->dev,
> >> +				"Failed to read, register: %x ret: %d\n",
> >> +				reg + i, ret);
> >> +			return ret;
> >> +		}
> >> +		if (sizeof(reg_val) > 2)
> >> +			reg_val = cpu_to_le32(reg_val);
> >> +		else
> >> +			reg_val = cpu_to_le16(reg_val);
> >> +		memcpy(val + i, &reg_val, sizeof(u8));

> > I wasn't able to figure out what this code does. sizeof(reg_val) is a constant so the second branch is never taken, and you end-up using memcpy to copy one byte, so what is the issue with endianness?

> I'm sorry I don't understand this meaning.
> In 'regmap_read', the last of the parameters is 'unsigned int' format.
> So, I've considered the two format 2bytes or 4bytes according to the complier.
> And our chip has only 1 byte data of each register, so I copy the data and cast the size only one byte.
> Is there anything I thought wrong?

You might be looking for the regmap _raw interfaces if you're
trying to send raw byte streams to the device (eg, for firmware
or parameter load).

--Tn5/Y3Bz1oT0rks3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN0/+YACgkQJNaLcl1U
h9DBowf9F5mK+AGnU4MyGoQs9eGKwFkaUHT1jIzCR+ykczJGPQ5N0Wiw10PUIncO
+Qm9x5X+7FwZijJjLPVQb03pK/SLVI2tjX3haPkbkBxjCM2y7+PLgRFBoGwG7H2Z
QQyB+R9aw5HVaXbfcPkNZP73Wbq+D3zkAUE9gmzV5T0GB/y+LoiKVhamye7spXlf
UnbNwAW6bQtfoIR880l4IX2u0pUHDvKv5PPM7jNSn1KOYsrVgh+5wZqc3S1h+Kak
EZKkrIJIrm/ob3c9xnBpZFPrIEt8ni5r9Idz4P6h1ujqAbO2aaRzUJIhi7ChHFMO
rHkRh356dzZFAfTsDWg8i5iIVhpHXQ==
=JJ15
-----END PGP SIGNATURE-----

--Tn5/Y3Bz1oT0rks3--
