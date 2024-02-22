Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF6985F85B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 13:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14BD783E;
	Thu, 22 Feb 2024 13:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14BD783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708605549;
	bh=HJIZQiDobf5GxOwMaLIptvld+RatnI/3K+JbnfdVwzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n0+K48ThCfeJNyVoDKpp0tv1+uZqf3GON/V8gdXL7pNGhO40TaqXIv2xvt7aLFSKF
	 7SGJg7ga1POuHvzO2ReZAhVKxbdUgpe7oV7d+ri9lyWcwTBpzaPdGunoxAr4L6duef
	 zc7Ie4kQSh40A0N2r9iOxmwtGuBFtGt2P5uu7QMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 411E8F8056F; Thu, 22 Feb 2024 13:38:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74111F8059F;
	Thu, 22 Feb 2024 13:38:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29168F80496; Thu, 22 Feb 2024 13:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6554F8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 13:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6554F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lnvJ6qYY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 92E54CE1D2E;
	Thu, 22 Feb 2024 12:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD46C433C7;
	Thu, 22 Feb 2024 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708604998;
	bh=HJIZQiDobf5GxOwMaLIptvld+RatnI/3K+JbnfdVwzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lnvJ6qYYOLeVoKfveH91sfsUv4Aqc9QDaj//vVCMo6S2qg+13cO4nIVAJsnwMjs4+
	 nbqdnsa7BCVoTajiZZsxYQ26uIcl+4mwmtqrHQeZVuTUIbiexKM7ustMujn/SRqDYc
	 JzQISeDOcRGwtjjNFJWujyf+afGySG/Uh5vBqq70Oz+5yXJ8F0pAzGKKaLt3Hd/ACb
	 xnm7msWQ+AGdtAEE6xTVknCVpO2t5eB40vQGXWfYrqVzhf39nDi3SeH0QU6w4Tq0R7
	 LksmBG7Uj4J5ea5d3NXlakAdln8KNbMXlGndzfWAV5RLP7d8sOSEEYfm17Qg1+KSDL
	 lD4kAPJP4cYkg==
Date: Thu, 22 Feb 2024 07:29:58 -0500
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.7 07/44] ASoC: codecs: wcd934x: drop unneeded
 regulator include
Message-ID: <Zdc-RtG4-FXYIkxk@sashalap>
References: <20240207212142.1399-1-sashal@kernel.org>
 <20240207212142.1399-7-sashal@kernel.org>
 <ZcS9EmcM1rtsNYy0@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZcS9EmcM1rtsNYy0@finisterre.sirena.org.uk>
Message-ID-Hash: HDLUYLDJGOTOTZHMUCO7NZICBE4AQLT4
X-Message-ID-Hash: HDLUYLDJGOTOTZHMUCO7NZICBE4AQLT4
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDLUYLDJGOTOTZHMUCO7NZICBE4AQLT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 08, 2024 at 11:37:54AM +0000, Mark Brown wrote:
>On Wed, Feb 07, 2024 at 04:20:34PM -0500, Sasha Levin wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> [ Upstream commit 35314e39dabcfb256832654ad0e856a9fba744bd ]
>>
>> Driver does not use any regulator code, so drop redundant include of
>> regulator/consumer.h header.
>
>This doesn't seem like an obvious stable candidate...

Dropped, thanks!

-- 
Thanks,
Sasha
