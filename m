Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C16A6BB4D6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:37:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6C41260;
	Wed, 15 Mar 2023 14:36:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6C41260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678887431;
	bh=V4eEh0FWKxJj++/8SncL6Dl3c1Y/ElU+NNFA8EJbxd4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N/6rBOP+TzSyIfFxu9IlbSEaqPPi2zdNUvf7j0b8OaVqf6Irx5vF6UOaUPCjXHTD4
	 URxA4FRwW5/thq0zlxc4yPs98GD5+HJFFN+aZX3TP4mQR8Osf1iqk8gQusCRrcXvYY
	 HynNuDdRP1NXAk9zqXaRr9fkr4v+XT7jPG7xiHWU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E839F80520;
	Wed, 15 Mar 2023 14:36:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B401F80529; Wed, 15 Mar 2023 14:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1925DF8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1925DF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gJKrioXE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D93FE61D9D;
	Wed, 15 Mar 2023 13:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9909C433EF;
	Wed, 15 Mar 2023 13:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678887365;
	bh=V4eEh0FWKxJj++/8SncL6Dl3c1Y/ElU+NNFA8EJbxd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJKrioXEUgNZ112Xj25aokZn1Epb0XEqHuvHWzUk188MVyIVBk/Dx9TC8+8CL8zZg
	 vOlDVFTHMLf1RHW0ll1CU0uEBESWACAaX+aHuPONsgBpjO32FVPMBv0+lwg8cZ7ImW
	 EydpkuVkNXbv2nr65F7T5HzfEM9252x1heTNGmuX9ppncieTHViM7KcfzE7LUFiq7i
	 E06xGkrTuc5xlKXvBzUbSocaEOCpRsjd6Z3FT3ZDrm8WUwDBfBYovWMLSB/ERYTKvu
	 ryCzBb+9MAK0qRJDjwpoakMKl5oVtpDHKuN2/BrGWO9fd4WnT632EDkt1tRacdv6QH
	 kQqUIShzY95CA==
Date: Wed, 15 Mar 2023 19:06:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: correct setting ignore bit on v1.5.1
Message-ID: <ZBHJwHN1rcqMmSHT@matsya>
References: <20230222140343.188691-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222140343.188691-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: FLJOCFTFBAE72ORI4SJ7PIULWJN75NOA
X-Message-ID-Hash: FLJOCFTFBAE72ORI4SJ7PIULWJN75NOA
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLJOCFTFBAE72ORI4SJ7PIULWJN75NOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22-02-23, 15:03, Krzysztof Kozlowski wrote:
> According to the comment and to downstream sources, the
> SWRM_CONTINUE_EXEC_ON_CMD_IGNORE in SWRM_CMD_FIFO_CFG_ADDR register
> should be set for v1.5.1 and newer, so fix the >= operator.

Applied, thanks

-- 
~Vinod
