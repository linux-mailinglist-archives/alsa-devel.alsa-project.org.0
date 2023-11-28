Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D58767FB675
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:59:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FD747F8;
	Tue, 28 Nov 2023 10:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FD747F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701165563;
	bh=5ArrUEd+VDRb8Mp2oGnmeMS9uZXS+0nOcVm4HzoTmAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SGBDDOZLrozUO38lFpjPCPcBmKSYmWlgTNrBaDajkl/TuzsMgeKfH+zdsZO7VDLN8
	 LjMd+aMBUxuENkAfxqK4+BR/smdlNMLX6/LqLY3sobSMYNOwoE85uotL14aRdPy0Ir
	 RObXxrhJnbiq536FqIhbWRp31EHuywKY6JINsfDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2316EF80570; Tue, 28 Nov 2023 10:58:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B7AF8055B;
	Tue, 28 Nov 2023 10:58:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6144FF8016E; Tue, 28 Nov 2023 10:58:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA53BF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA53BF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m6C5rTA2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 99052B839B9;
	Tue, 28 Nov 2023 09:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C22C433C8;
	Tue, 28 Nov 2023 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701165522;
	bh=5ArrUEd+VDRb8Mp2oGnmeMS9uZXS+0nOcVm4HzoTmAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m6C5rTA2jAjEF8afeKlTB6aBB9Y5ULymK2S/fsN64B3SFI91nsJ6ePILQZqYd9eSY
	 mAweO/BFcgEkt6UqPYBX19PmJ9vxOQxLdfXLtsFMAX8HtzdA6prob5zH4W3nN2oyUF
	 32SQbTFqlZMIog6XdU2X9+hJzfbcM+E01OpMIjjqnDBcn5qRsN9q97q+AmZByEioxm
	 a+SpdW2IGa9U3m/Vrgdm++h0wKzuNkN8e6SCsicjYGJivIlw1fa0eZzxG16nM+r52N
	 T0oPjRqtiodzRpUZi2YQKOPcCvydBjMfi4neVq8Fo62ly1aHxVRJ33yKgYalYvsw0w
	 Gt2MLo5g/4Brw==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20231124180136.390621-1-krzysztof.kozlowski@linaro.org>
References: <20231124180136.390621-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soundwire: stream: fix NULL pointer dereference for
 multi_link
Message-Id: <170116551879.73476.11576514501948917974.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 15:28:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: TT2UERHOEA6IMAVFDC4HILUAREGFV7UE
X-Message-ID-Hash: TT2UERHOEA6IMAVFDC4HILUAREGFV7UE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TT2UERHOEA6IMAVFDC4HILUAREGFV7UE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 24 Nov 2023 19:01:36 +0100, Krzysztof Kozlowski wrote:
> If bus is marked as multi_link, but number of masters in the stream is
> not higher than bus->hw_sync_min_links (bus->multi_link && m_rt_count >=
> bus->hw_sync_min_links), bank switching should not happen.  The first
> part of do_bank_switch() code properly takes these conditions into
> account, but second part (sdw_ml_sync_bank_switch()) relies purely on
> bus->multi_link property.  This is not balanced and leads to NULL
> pointer dereference:
> 
> [...]

Applied, thanks!

[1/1] soundwire: stream: fix NULL pointer dereference for multi_link
      commit: e199bf52ffda8f98f129728d57244a9cd9ad5623

Best regards,
-- 
~Vinod


