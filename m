Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E444D2C10EE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 17:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F175166C;
	Mon, 23 Nov 2020 17:44:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F175166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606149937;
	bh=KM4r7MwaPKpXE9JTfWfEWcXBm5bb1qbPQ3X0VvyVd4M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZUOQF2X9u3RfGrE9w3hRrM0Lhb+SvpplXptwulCvgcOGw/WBl043q1ins6fYxyny1
	 MWXV7Q7dFpmZ3LF5qsterapS9i8v/UOIWTwoAtcoDFxSZN5gNkE8Ck/bsvluKCcmKJ
	 +SEc6XC6FSPI/4bpjqYO/V2xge8Ji82d/BO6RcGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 051A8F80255;
	Mon, 23 Nov 2020 17:44:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27182F80255; Mon, 23 Nov 2020 17:44:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7298DF8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 17:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7298DF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BPkOfmVs"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF7C822202;
 Mon, 23 Nov 2020 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606149833;
 bh=KM4r7MwaPKpXE9JTfWfEWcXBm5bb1qbPQ3X0VvyVd4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BPkOfmVshAo49whRlUaSnutvud9KcolrP6aA8eBshzeBmrIrxycJYG2yUxRqe8OSW
 6+Z5vmrxrgY1EX6Ac3CqA2nguHv5JI/QiQ08BSzOSnW7M0ywRc3HK78bL8DqgYKJlI
 NDESmxQh0N+cEAiCsckinP7FvUcf9Luhxd1KfeVQ=
Date: Mon, 23 Nov 2020 16:43:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201123164330.GG6322@sirena.org.uk>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
 <20201122105813.GA3780@kozik-lap>
 <20201123104832.GY4077@smile.fi.intel.com>
 <20201123123731.GA6322@sirena.org.uk>
 <20201123124129.GA170000@kozik-lap>
 <20201123135006.GE6322@sirena.org.uk>
 <20201123145831.GA202597@kozik-lap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IuhbYIxU28t+Kd57"
Content-Disposition: inline
In-Reply-To: <20201123145831.GA202597@kozik-lap>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


--IuhbYIxU28t+Kd57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 03:58:31PM +0100, Krzysztof Kozlowski wrote:

> Having these of_match_ptr() for OF-only drivers is not the correct way
> but rather something which is copied from existing drivers into new
> ones. This is another reason for removing them - people will stop
> copying this code all over again.

Well, it seems that the issue the PRP0001 people are having is that
they'd rather that there were fewer OF only drivers!  More generally
it is good practice to write things as though there might be non-DT
support even if it's not there at the present time, it's easier to not
have to think if it's strictly needed and it helps anyone coming along
later who does want to use things elsewhere.

--IuhbYIxU28t+Kd57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+75rEACgkQJNaLcl1U
h9BiSQf/emZ4fCarHLUI71Hqpc4QJAz+w5gA+DRKeiySta5dIWLLGCzbREL5lUCh
93fxw8vLQKryX71eVTwydSxRLMwPHNi7XHtBWKXwrqFe45byHdVjcE2ggMowivFM
3+lTwB3Gl60GYaSppHfW2wVS3gTCwCCF78Asrao1B4ipJMYdKT1j54n8HHXF4mMT
iP2JBmGkknT9+RJVBA087VYVIzKkflE7H9q4h6JyMIrr9F6Gnwx6Xkawv2NAwPwm
BYDXl90zQQGBHao62BXyw/IPdYSi4KVzUzaL0fiPR8niLaXdcovru7xxHPUabpmn
CX4ANWeN0bn+yvk3ImcJJ04Jpp5SoQ==
=AliB
-----END PGP SIGNATURE-----

--IuhbYIxU28t+Kd57--
