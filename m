Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B10332449DB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 14:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43ABD166F;
	Fri, 14 Aug 2020 14:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43ABD166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597408779;
	bh=dblQaQ5VxViI0Ta4f0SOD8uUc/RCGB7Zn8xY6o+ZawY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Us4d3EzAQFIYfP/gZub/GS3cwj9QVTn40u38/ZHMLx8wFJOB7M6fiA+DSh1Harqts
	 XcUfMbNB5PXSNZuKKgq60hVUPqXmbBF9q4eYvksBFEKz1V23gwFFmMFz7Irnf5Wi8h
	 TFm/VLIanJExXN+sJyjZh0hNSILHkbXBSrnfytGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69104F800F4;
	Fri, 14 Aug 2020 14:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93CC2F8022B; Fri, 14 Aug 2020 14:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87FF0F800F4
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 14:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87FF0F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="x9Hw9BNC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51ECA20866;
 Fri, 14 Aug 2020 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597408660;
 bh=dblQaQ5VxViI0Ta4f0SOD8uUc/RCGB7Zn8xY6o+ZawY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x9Hw9BNCC7AqXQVYmrIfBumdIeNeOxBoPLJdGhbSJ/FhcU5kq5M0ScLt45Ul8LZ79
 gGUMkVZ0afJgKiyT+xu6/1jCTXR/lytJ9T9V+hdrU7UWGWc5V8TZqwK4GTpFUTrjKp
 2W5znN9YjcXJS4XMeqZfHWeanzqdR+BtVTMvrvaM=
Date: Fri, 14 Aug 2020 13:37:12 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Subject: Re: Enabling DAPM for Dummy DAIs
Message-ID: <20200814123712.GB4783@sirena.org.uk>
References: <DM6PR11MB290561D66CB13F86B419004CE8430@DM6PR11MB2905.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB290561D66CB13F86B419004CE8430@DM6PR11MB2905.namprd11.prod.outlook.com>
X-Cookie: Non-sequiturs make me eat lampshades.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "bard.liao@linux.intel.com" <bard.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2020 at 05:21:40PM +0000, Sridharan, Ranjani wrote:
> Hi Mark/Takashi,

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> What would your recommendation be to get around this problem in SOF? Thanks for your help.

Actively using the dummy CODEC at runtime isn't a great idea at the best
of times, things would be a lot easier if you used something with actual
audio paths for testing - as far as I can see the issue is that you've
told the system that there's nothing connected which is reasonably being
interpreted as there being no need to power anything on.  If you intend
this to represent an actual connection it would be better to use a
simple CODEC with no software control rather than something that
explicitly means there is nothing connected.

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl82hXcACgkQJNaLcl1U
h9CaTwf+KMxOa08jMGVGW6g1nGTLycwtWSKCz4+NDiCsD6XHdNv593Xndc+fKmKb
KoxXgXoumA2umXsfOH4Ka9F0MRUuCxkb+IwE9KIdq7Oq7QBV2gQYNXyX2IX94tFI
pTRbOcXk+lEBMawBbLsnjU9Aq0lISG2vmfZB6rMbspWgK4Gl8X1k17MEc63DaGMq
mp/7Qqj2OPKCAwYpnJGNOrW5RruUCub9P+GYGdhVmxH2DOuTPjFa3G5es76IFvSf
zigupkyPVZ+rTDLWFTBfF3v3upQvm7GQ1dcCLRiTWlAXkOUjRTWDGUeZFypO5glE
voIcgjHNNzarbEKhknS8rNN5WvWdnA==
=x6wX
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
