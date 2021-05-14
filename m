Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B82380D2E
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 17:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D31F1777;
	Fri, 14 May 2021 17:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D31F1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621006350;
	bh=Jw5WbrKaK58stPthP0QwAZkov+5hEKRXAOBHxLndh7c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=swiJVUTRRus1bVsWwbaZjcg7UxAXBKMJAPbpaSo5a9MwzXknBunRB36/tioHHuxvm
	 +C0wseKmTPTCucX4T8komVQCPTheDZAmeuA2P5B9LG1ztDtK4EWkkwx1UUsSIQhLAv
	 ksBqDKbBJS395PPotHAzYIu95kA/80dtqF0reGwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB310F8020C;
	Fri, 14 May 2021 17:31:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0350F80240; Fri, 14 May 2021 17:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21BEEF8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 17:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21BEEF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QB3622Kh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F26DD61454;
 Fri, 14 May 2021 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621006255;
 bh=Jw5WbrKaK58stPthP0QwAZkov+5hEKRXAOBHxLndh7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QB3622KhuCsNng+oVdaxcDzh2R5t96nGI19NPmYMGLLKmTBXRWP2a6P7euJGePKGd
 1Zv3f5aHzzLvuNRi8vi6fsEMjA8ivVQaVxJ8sXgkeeG9EZnNPcs5O7akVYOy7qGRKb
 CHbTDyD7n13upd0sz1lSzdcTyzYs+yQs6OU0vPMX0koyVZzc46MPa1S8rV7487ypzz
 SsSEfZwWtB9MFGAzpJH7h6zuIUW02jeYToRGRMxnlguDuW2jnNTWcgK+TW7lJo1OsY
 nF5fRj64C8U56hURXnmrX7/66KUqNTpLIgnFUJrgzGgCvTYLJOjMDSGC+l61g3MAD7
 OIQx1x4LE66qg==
Date: Fri, 14 May 2021 16:30:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
Message-ID: <20210514153014.GB6516@sirena.org.uk>
References: <20210513114539.4813-1-srivasam@codeaurora.org>
 <20210513133132.GC5813@sirena.org.uk>
 <a6649fad-c2ca-1808-4227-8bcb373f66bd@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
In-Reply-To: <a6649fad-c2ca-1808-4227-8bcb373f66bd@codeaurora.org>
X-Cookie: Necessity is a mother.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 14, 2021 at 12:20:46PM +0530, Srinivasa Rao Mandadapu wrote:
> On 5/13/2021 7:01 PM, Mark Brown wrote:

> > This commit doesn't remove the matching update in triger() so we'd have
> > two redundant updates.  I guess it's unlikely to be harmful but it looks
> > wrong/confusing.

> Yes, It's not harmful, as clk_prepare_enable is enabling clock only once but
> maintaining count.

> As Some times in Suspend/resume Sequence not hitting startup/shutdown, but
> Trigger, so for maintaining

> consistency not removed in trigger.

This at least needs some commenting so that it's clear, it looks buggy
at the minute.

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCel4UACgkQJNaLcl1U
h9AtTAf+LYcPOf6JSMImI2cuYbGIbm6pkW/Gx2rR/b2MwTYRacf5Y69rz++r39VM
W1M2i1v9UGvb4CoYMeGn4NMA1m0r94UDo6vRC0xqx+WIbXglUiFmrT/h76K+1uEr
e8jabqpQT3dcdeY938IJ7TFdGCyRafKd/1Dr5nazc7xRb8yc2i5SPV0RRsiFpYO2
otRmdXuyqgNyIV7t77179ZiZUGZvH7/l/Fod8mZXLM9GkpEJkzAe7xIxZicP+EHg
piX4zMQJg2agEhKhFDo9aRTl9erYxOAoMTXIcrBAuxG4JJLnF0sEOhhqCAcILPqm
r+qkC06Hv8IgT0CVDC4yDXiM3b7dMQ==
=D5DP
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
