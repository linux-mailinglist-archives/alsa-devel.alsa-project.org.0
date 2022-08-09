Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1B58DED9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 20:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B7285D;
	Tue,  9 Aug 2022 20:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B7285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660069529;
	bh=Orpxpb4ht5cPC7Dmsq+/pb4XIrE3ThWv+PJnw3hJ7e4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWn3o954nMZ21BPLAUi3rbqoh3wDjpkJzqU04wLjkAsFifWX0KW4hl29kK6FIqra3
	 kAd1DiEgpV5wXCv5oUVN0G79Lnd4WK2VuNw5CQgyUXvPeQTvgh9VqY54t/cmB338mz
	 hFxA5z80+0AJuvljkyKrfiEa7tmc5VLpxUXnrPcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4D7F8012A;
	Tue,  9 Aug 2022 20:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B1DF8049C; Tue,  9 Aug 2022 20:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70C50F8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 20:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C50F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UfyjxJkB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4610761210;
 Tue,  9 Aug 2022 18:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1456AC433D6;
 Tue,  9 Aug 2022 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660069455;
 bh=Orpxpb4ht5cPC7Dmsq+/pb4XIrE3ThWv+PJnw3hJ7e4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UfyjxJkBaNxVbvRwC2r0rZpqU53z5JEtiDzCh/itrvbU5rw32TLXOuYECgtiiUh4N
 sLsmF5mZKHb21ZR/jKEikDBKKGpEjuiZx3DedIlg08AWoPmsMoqv/tiZgwL26OHbj/
 eOyts2pLeTu12bZm5S5IwUF6sDjZk2CJ1QC/riFKIob9FGSbmRAy1gpky6u5aoLyqO
 LxNXP57+6cJih1V++iDehFhGJERKHnyYckUHRgVXKiyXhr2F/e5csIJGOikPlorlEh
 Xi4MuuuHlrenP5ypB06He/SgYZasBbimGB6t3WH3cQFB7H4oUaEiciVj15RhLgKPoa
 +96h0l6UbpqHg==
Date: Tue, 9 Aug 2022 11:24:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: Drop Dan Murphy
Message-ID: <20220809112405.071130e2@kernel.org>
In-Reply-To: <20220808104712.54315-6-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808104712.54315-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
 Tim Harvey <tharvey@gateworks.com>, Rob Herring <robh+dt@kernel.org>,
 linux-hwmon@vger.kernel.org, Robert Jones <rjones@gateworks.com>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On Mon,  8 Aug 2022 13:47:12 +0300 Krzysztof Kozlowski wrote:
>  Documentation/devicetree/bindings/net/ti,dp83822.yaml           | 2 +-
>  Documentation/devicetree/bindings/net/ti,dp83867.yaml           | 2 +-
>  Documentation/devicetree/bindings/net/ti,dp83869.yaml           | 2 +-

Acked-by: Jakub Kicinski <kuba@kernel.org>
