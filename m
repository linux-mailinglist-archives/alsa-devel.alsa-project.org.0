Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771481BD14
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 18:22:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC147F1;
	Thu, 21 Dec 2023 18:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC147F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703179348;
	bh=Oz9rZKv3srFqXd5f/Yxy9FoX3dnWg2VKT+uxt+4RWY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q1hhX4/G+NGcp+hn6MgF2ErX0e6XUXNlHPDSvpeTjbY+Wky+Brk6mTFCjUaC40AE/
	 EmnlRSjPxgreKysSw9gKEe99+NxzQMYKucWDBpG2m9669LlVTBY3UOaVIOcOOnpl5G
	 NZW9XKStjoXifRdKBHXdb79xo0yY+rB+9JPT+G3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DBB9F80431; Thu, 21 Dec 2023 18:21:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3244F80571;
	Thu, 21 Dec 2023 18:21:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6513F80153; Thu, 21 Dec 2023 18:21:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A9B9F800F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 18:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9B9F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AeadX2GL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 99D24B81FB4;
	Thu, 21 Dec 2023 17:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB05C433C9;
	Thu, 21 Dec 2023 17:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703179307;
	bh=Oz9rZKv3srFqXd5f/Yxy9FoX3dnWg2VKT+uxt+4RWY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeadX2GLX7E0vuqISV8pV/z4EkTx6WYN1QNTeAR++yMgBK/GhIJHIL8IWrDYB/kqv
	 3MLdQpWNx9nGUfY85IQtj3MRUp8PW1BD4S74gTcF/VHxJt5nPnmfxLaFGvulMIDdSq
	 vImZzefjmKgB+hrXq+YikvdVAVj9hU7oe3rnpNCvTIcBt4cYDBUeueFPt87FkaCoSH
	 wxVaardrlcb+dL38Vubqw/TyC0PnZXJU8wiYU81DLe3A3wkkl5ERZ3SfD8ncVE/cPD
	 fEVSwlqO+uLuiOyESiuPdFLTRNV4L7j3yGNyuZAtxyxsRC9quU8TlvpY1XhkjeHRU1
	 1I+FtTyNs8zWQ==
Date: Thu, 21 Dec 2023 22:51:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 09/16] soundwire: crc8: add constant table
Message-ID: <ZYR0Jttc6TUL4HlP@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-10-pierre-louis.bossart@linux.intel.com>
 <ZYA0gKf3bZgY4X_s@matsya>
 <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
 <ZYROvUA7RrqQknlM@matsya>
 <98600d10-2130-463b-aa61-459bc1293bb8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98600d10-2130-463b-aa61-459bc1293bb8@linux.intel.com>
Message-ID-Hash: TT5WD7XP6NW6AUL37U7C7I46YRHWJHMA
X-Message-ID-Hash: TT5WD7XP6NW6AUL37U7C7I46YRHWJHMA
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TT5WD7XP6NW6AUL37U7C7I46YRHWJHMA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21-12-23, 18:15, Pierre-Louis Bossart wrote:

> >> I don't mind reverting to a dynamically allocated table populated at
> >> boot if that was the consensus.
> > 
> > Most of the kernel users I looked have dynamically allocated table
> > populated at boot, also out of many users how many would support BTP.?
> > Your older platforms, current qcom dont, so not point is adding for
> > everyone...
> 
> All Intel hardware supports BTP/BRA, we just didn't have a compelling
> reason to enable it so far. I've seen AMD stating that they also have
> BTP/BRA. That's 2/3 of controllers.

Not all qcom platforms support this, so this would be enabled
selectively for them

-- 
~Vinod
