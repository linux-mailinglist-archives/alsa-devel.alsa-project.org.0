Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC6A64C8DA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 13:21:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63CB018B3;
	Wed, 14 Dec 2022 13:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63CB018B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671020486;
	bh=Kvtf89epnIka0ewCiy2bwTCDZMYaQDZFo0v3TeWBBPE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pzPrnJmzVRCF6KZRTzCP/4IXPy2EoYSIN3MBUsXCYpg1qB5fmQi4UcCr0JlMX2XBA
	 DjNC6+h5l14TyFSU6twQ2X6lprRGLMPfITFqdFsi1yZWn61kFEXFCe+Lec2hqIAkJJ
	 y9E0AKwANbpHDmuMwDe9FKk4nLuDbHSETIe2UVQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6E4EF80310;
	Wed, 14 Dec 2022 13:20:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF4FCF80310; Wed, 14 Dec 2022 13:20:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 021F2F80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 13:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 021F2F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Bmj7W0h2
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BD3CD6602BF9;
 Wed, 14 Dec 2022 12:20:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1671020423;
 bh=Kvtf89epnIka0ewCiy2bwTCDZMYaQDZFo0v3TeWBBPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bmj7W0h22ImHXanYrP/14WsZcnSst5QFgL9vwf5ZuEXCG/GazXGV1pmwo2tZsIXs6
 RNj06Y6PFQujRV6pJoNfGF5oBvXTu0+XoWansSdHkQAx+zOlS4I8edsCuyMGUiTFK+
 /YCPtsueecDrh9f3bMZPdAFFSCKU9JVBRCNaiOEAlSRhW/3jCMZRVkuKS37idlLj6E
 V+oWnhtFioo0Nq7+E++rgKeKYHCWjg5yRZQX1m1HD6WnsraNMhTyEUg5FYzvZqzNBL
 4JUpFR3YP+7J5JDHyZpyhPv6cxjkb7QmuPr0wXt4OjZ+kEkqJ42Mtz7fuJhPdBIVDK
 1TAgFzGsFVixA==
Date: Wed, 14 Dec 2022 09:20:16 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] kselftest/alsa: Increase kselftest timeout
Message-ID: <20221214122016.2geliu5k5n7fbo6r@notapiano>
References: <20221213183242.1908249-1-nfraprado@collabora.com>
 <2ee34e21-44bd-71e7-6da2-f4bea9a35452@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ee34e21-44bd-71e7-6da2-f4bea9a35452@linuxfoundation.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org, kernel@collabora.com,
 Shuah Khan <shuah@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 13, 2022 at 11:37:56AM -0700, Shuah Khan wrote:
> On 12/13/22 11:32, Nícolas F. R. A. Prado wrote:
> > The default timeout for kselftests is 45 seconds, but pcm-test can take
> > longer than that to run depending on the number of PCMs present on a
> > device.
> > 
> > As a data point, running pcm-test on mt8192-asurada-spherion takes about
> > 1m15s.
> > 
> > Set the timeout to 10 minutes, which should give enough slack to run the
> > test even on devices with many PCMs.
> > 
> 
> 10 minutes is way too long.
> 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> >   tools/testing/selftests/alsa/settings | 1 +
> >   1 file changed, 1 insertion(+)
> >   create mode 100644 tools/testing/selftests/alsa/settings
> > 
> > diff --git a/tools/testing/selftests/alsa/settings b/tools/testing/selftests/alsa/settings
> > new file mode 100644
> > index 000000000000..a62d2fa1275c
> > --- /dev/null
> > +++ b/tools/testing/selftests/alsa/settings
> > @@ -0,0 +1 @@
> > +timeout=600
> 
> Adding timeouts like this especially 10 minutes will increase the time
> it takes to run tests. We run the risk of people not wanting to run tests
> anymore.

I set it high because I suspect the time it takes to run pcm-test might be a lot
higher in some machines (even on mt8192-asurada-spherion, it takes 1m15s, but
only ~10% of the tests are actually running, since many of the PCMs are
disabled).

But I can lower it to, say, 3 minutes, and we can increase the timeout as
needed.

Thanks,
Nícolas
