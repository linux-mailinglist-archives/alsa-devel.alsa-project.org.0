Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 115C03440A5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 13:17:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA1D1612;
	Mon, 22 Mar 2021 13:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA1D1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616415471;
	bh=MR2f7IFBl4DUtgnudwNrV4yKMxynGWswKdUshB9QITo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RCeRuik5vf+2tnz//nPlK9p6gADZsHjy52G9U1dqa50AhoOG0w5hvol87RpGO4Erb
	 4KYH2+jT4RrQjMj8M9hkKjdsW9DfCdOZLl8P7i23dNXWAcrCtLc1P/rNJGUypu+x5+
	 EbnrbfSsW+Cwfm+1RDYp2cSbxeBXCG2kRc5nuLwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFB0F80155;
	Mon, 22 Mar 2021 13:16:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC360F8016B; Mon, 22 Mar 2021 13:16:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CA86F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 13:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CA86F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="arf85JXD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 176236196F;
 Mon, 22 Mar 2021 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616415380;
 bh=MR2f7IFBl4DUtgnudwNrV4yKMxynGWswKdUshB9QITo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arf85JXDRHi2ZY97VnXS3DFQQFASj63KYpaP7eLwJlvlJUgywKlzWF5iTbo4rVUTK
 cXyfqrsO2ex53T++rcwzgt6uNcsF4fvZ89fXnlFcgMStjPSuEWsXasZFL15JpdS7DL
 mQlFGiDm3EDoUhUwlxSP3wj9eSdS+pofJe/vSFxI+uK6F5UK64EgpHizvrCB8uNrtC
 9Oz7OVPMlrdR5XExJF78j3nTrdLn/bx/HtiBewznsl/QYlcb52lsN5SKN4nyN/JuDy
 wO2ogPxoa2DqzzQHCfKJDseFaInEwJ5Hj7UrM681/zhM2q5QxpCRIxXoEhDEQxucxq
 4KRtx8Jj8IWCw==
Date: Mon, 22 Mar 2021 17:46:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v2] soundwire: bus: Fix device found flag correctly
Message-ID: <YFiKjzAjqrU44TlM@vkoul-mobl.Dlink>
References: <20210309104816.20350-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309104816.20350-1-srinivas.kandagatla@linaro.org>
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 09-03-21, 10:48, Srinivas Kandagatla wrote:
> found flag is used to indicate SoundWire devices that are
> both enumerated on the bus and available in the device list.
> However this flag is not reset correctly after one iteration,
> This could miss some of the devices that are enumerated on the
> bus but not in device list. So reset this correctly to fix this issue!

Applied, thanks

-- 
~Vinod
