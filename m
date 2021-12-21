Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3F47C523
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 18:40:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E6B17CC;
	Tue, 21 Dec 2021 18:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E6B17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640108442;
	bh=RUxBK3Sz6ZQbxCfbdMI94N4GisqxuF36fxPs7yZeswY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqGwG2/20rQCUzOplUzltViUf/UuljCZHcapbUgGk64CtEdlKN/eNyjbqusqiZZLW
	 zOHQo6VuCa/b3levlMV8tcux9mWnIG+7owNP+5jQFMT+ALaF3b5MzLpiZc8Pclb+PI
	 YZqzNcELJ3sZSL+B6Tdp3ewFFjbF3na8f/ZtsNX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E55F80125;
	Tue, 21 Dec 2021 18:39:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7875DF80118; Tue, 21 Dec 2021 18:39:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FF43F80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 18:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF43F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HtuExwT+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C5C0616A0;
 Tue, 21 Dec 2021 17:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50D6C36AE8;
 Tue, 21 Dec 2021 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640108363;
 bh=RUxBK3Sz6ZQbxCfbdMI94N4GisqxuF36fxPs7yZeswY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtuExwT+QBunVcgRxK+Vn4aMU3YsI4/WRH7JP0Bwq8SGkBn3H1UlFrv5WGbLKLdzq
 xixWXfxu6R6tMB2Fvoh8urM3RMPTOClmu1TldTOZsEcrc5az7VObeMHLNzDb9OzJL6
 RrlNeJkcpeEdnTsPifZMe1LwnZHBDTc4OXjMp0INuR5qCu0E1R9/EvWxbnF9jb/dhk
 v2SyhVMdBe5O39boDrpj21pcKBKRAbnRmsMFZfd74OhC0vvAm6St6XExVJsiLqAXk2
 3aSsVD83t4F7XCDkIeVTEoegzp2hXKwlKNbqe09fmW+rUwQiKo3eG319t+jcmYbPB2
 o71/4ESsN43Ow==
Date: Tue, 21 Dec 2021 17:39:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC 18/37] ASoC: Intel: avs: Topology parsing
Message-ID: <YcIRRevkBpM/jIKV@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <20211208111301.1817725-19-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8qQgyWuz5wSMkO0z"
Content-Disposition: inline
In-Reply-To: <20211208111301.1817725-19-cezary.rojewski@intel.com>
X-Cookie: knowledge, n.:
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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


--8qQgyWuz5wSMkO0z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2021 at 12:12:42PM +0100, Cezary Rojewski wrote:

> Implementation of ASoC topology feature for AVS driver. AudioDSP
> firmware supports a wide range of audio formats, module configurations
> and multi-pipeline streams. To represent all of this in form of static
> ALSA topology file, which resides usually in /lib/firmware/, while
> simultaneously not hindering user from any of the possibilities, 'path
> template' and its 'path variants' concept is introduced. These are later
> converted into actual runtime path. This part is explained in follow-up
> change.

This sounds like it should be extending the topology code (it's talking
about "ALSA topologies") but it seems to be outside of that.

> Path template is just a pattern like its name suggests. It is tied to
> DAPM widget which represents a FE or a BE and is used during path
> instantiation when substream is opened for streaming. It carries a range
> of available variants and only these represent actual implementation of
> a runtime path in AudioDSP. Only one variant of given path template can
> be instantiated at a time and selection is based off of audio format
> provided from userspace and currently selected one on the codec.

So this sounds like it's baking a table of use cases into the firmware
rather than a separate UCM type configuration file?

> AVS topology is split into two major parts: dictionaries - found within
> ASoC topology manifest - and path templates - found within DAPM widget
> private data. Dictionaries job is to reduce the total amount of memory

Or are the use cases baked into the driver code if they're in the DAPM
widget private data?

> +struct avs_tplg_token_parser {
> +	enum avs_tplg_token token;
> +	u32 type;
> +	u32 offset;
> +	int (*parse)(struct snd_soc_component *comp, void *elem, void *object, u32 offset);
> +};
> +
> +static int
> +avs_parse_uuid_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
> +	guid_t *val = (guid_t *)((u8 *)object + offset);
> +
> +	guid_copy((guid_t *)val, (const guid_t *)&tuple->value);
> +
> +	return 0;
> +}

I have to say I'm having a hard time telling if these parsers are doing
the right thing - the interface is a bit obscure and all the void *s
make it hard to follow, and of course the format is undocumented.  I
looked through a lot of it but I've definitely not gone through this
code properly.

--8qQgyWuz5wSMkO0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHCEUUACgkQJNaLcl1U
h9D/3wf/Vlel6bZdsm9QW+gEWsJX+EWECWKlRTQurnZlVp7Npi2SAFPGusSA5NHg
PyXo8klAffzzNdfogFmOdjfVFgmNMmoQLRM5x4knrPPabzt7qMdQ0rLbs1ioFr6x
+EJfWsKq453nMcx5x5bmhYQKv3HoPsKHmhLryQn2DssuSzK0JhvEmBnM+KBkYcpW
1sQwqYhzYpl6XU6bDe8seeLbl4Yih7hnrqT9kqoubXhA62E7Y17ap/q7W8gUqvKK
cDLrouT/VxIm9aflBaTh74OWCMW5Myv0JPkOESMaGoDFUjW3Fd2v21XEXUZRgOxU
ala8ERiYXDx7zBcJGZS6ZgtBOyn9Xw==
=1seF
-----END PGP SIGNATURE-----

--8qQgyWuz5wSMkO0z--
