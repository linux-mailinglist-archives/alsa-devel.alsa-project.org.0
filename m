Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38342FA1C0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 14:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F9FC1830;
	Mon, 18 Jan 2021 14:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F9FC1830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610977027;
	bh=KJkv8BLp1zqzzONnd8TlNHpETcZRxUOCJqiN3R+jOSk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3/8bGt+o0UmdB0pGKBh1k0HZ65dewusX1bnO3qcdt/AC4BU76FreRo3L1Z110Z4f
	 6dAKs0MWQkWrIkTpmKAq+tXwLtOcZu0jbO9trdb+kw+bn2c5JJNPtPNN/0ejETfxas
	 gN3+INAkvym4YcJ7PEt8rm9Fz4xSRRHA6FtDyT08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA06AF80166;
	Mon, 18 Jan 2021 14:35:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 735ABF8016E; Mon, 18 Jan 2021 14:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8215CF800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 14:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8215CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SGJSI2AX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1202D2065E;
 Mon, 18 Jan 2021 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610976926;
 bh=KJkv8BLp1zqzzONnd8TlNHpETcZRxUOCJqiN3R+jOSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGJSI2AXm5zS1VasxgWirWyM6U2nwPclVuOLKArIqfaC8NcbYsjYk9Kthq37dcCsB
 ZnW2Zsk44/B3WIbzKWEsLSqVIcZqii1Mx9VFM4qvqvOR7cz3zhVVZeC1sHdnnHO69O
 IRZK+pWErVuDlyHS+M30I1f63YKf+02t4777wc+kjvfgWcTc85B6Ce8cyHe85a2M4x
 dLh5m/rvjj99fGMNr4pwF7TSzGHek+KDeiL72nlLjL4sV7JSZAgMFOHOy1oBiRZ7+6
 H0K/TXIGzk+13clEPv4sDeSJGIRMQy7frPOmR1URLdlUhHGrEa0AoF/n4dEPtP/WRv
 A/VmNt/sIwQhQ==
Date: Mon, 18 Jan 2021 13:34:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
Message-ID: <20210118133449.GL4455@sirena.org.uk>
References: <20210117212252.206115-1-hdegoede@redhat.com>
 <20210117212252.206115-4-hdegoede@redhat.com>
 <20210118130227.GI4455@sirena.org.uk>
 <5ccf48f4-45dc-3a30-3d6a-cce066f01270@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y+Z5jE7Arku/2GrR"
Content-Disposition: inline
In-Reply-To: <5ccf48f4-45dc-3a30-3d6a-cce066f01270@redhat.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christian Hartmann <cornogle@googlemail.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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


--Y+Z5jE7Arku/2GrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 18, 2021 at 02:13:50PM +0100, Hans de Goede wrote:

> More in general I'm not aware of any (recent-ish) x86 GPIO controllers
> not being able to do active low interrupts. In theory we could hit this
> code path on ARM devices using ACPI enumeration, but I don't think it
> is likely we will see a combination of ARM + ACPI enumeration +
> WM5102 + GPIO controller not capable of active-low interrupts.

I've not seen this issue on any ARM based systems.

> This overriding of the flags definitely is necessary on the Lenovo
> devices in question. I could add a
> "if (dmi_name_in_vendors("LENOVO"))" guard around it, but that
> seems unnecessary.

Possibly just an update to the comment to make it clear that some
firmwares might legitimately set the flag?

--Y+Z5jE7Arku/2GrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFjngACgkQJNaLcl1U
h9CP8Qf+MXPlUpgbAKzwajprfEMzZMYQnFLxebAZXMSPqNuvy++4sphdG5aT9igG
VqeeF6nQk3phzFmwwFVMFtKr0dRQSETqszmRprcjQM14nwLba3ZNPl7GTZpqZflc
p2vHt/95QsAWH8FZSwYyJ5Zam5Ffix3KOHij2IgP2vqNxAKVIjHO8M6KQMT4+zKt
eGMY/l1XpEnv9BUhumLJzjfeB0zGtx/uRerqI/H+7T23RasJrUGiYKmYgaHIhNuD
5jJCyabbx0mizqDLMOSD/A8VkcUGnKldvGMrVGtaCR1gREQm5Ehe2f9ztQYYt73c
9DA8YTGBfKanrS1bEYh8gZWlTBkwyQ==
=0pvY
-----END PGP SIGNATURE-----

--Y+Z5jE7Arku/2GrR--
