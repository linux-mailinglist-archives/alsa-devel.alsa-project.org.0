Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71246568F91
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 18:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F4EAE9;
	Wed,  6 Jul 2022 18:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F4EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657126008;
	bh=UexN+rlmJSiLQCAdT+rimBN77NKCwmVWbryXHRMEbgw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tr/TAzerQGh6IuAWEuX6C1AoW3oUAQxVsElRPQXrr55vUvgKTfXqGV9mnQf5rw05j
	 Co6U5f3nVK6/agmn/qnJJ1HnANndozQDK6nyTlj+jcei9Jz8T78d1rUhAg9mj1TlHn
	 PLDUC2QeyG01T0PO7rC7HvrTfdk6SKhXMlJarW2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58ED0F8032B;
	Wed,  6 Jul 2022 18:45:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1703CF80104; Wed,  6 Jul 2022 18:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D04F8F8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 18:45:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D04F8F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lWVzK7xj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B2E561D65;
 Wed,  6 Jul 2022 16:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E07C3411C;
 Wed,  6 Jul 2022 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657125939;
 bh=UexN+rlmJSiLQCAdT+rimBN77NKCwmVWbryXHRMEbgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWVzK7xjaV5efxKrA8ESlKU5Z2Gzp5DmgvYQjW9Dv1W/G+ukRRc6SYv6tL/rAXOWS
 EHbtTesPZctKLcXAvNyoJkx2wss1tSORhEzdhFinzOZ0yZC4qwlUtDWpNjvuZvd2KJ
 mTS0Q9MSnMlzM3sOGR6va4Xzwq/uQWBzCToB4DmwL046nZnNlPxBE1vB62Xqqawd+H
 cAbTBHfRS9oHpvM9aVmJ3EryElfNzKVPAVhPbpQZVXpb+S0uXRnufdsbqFvXz9Bbxz
 jV7ghZ+9FSfyMUbnDO31aAmJc4RdFnLO6Kvy+wj+xuEFROMUR7zSyf9UIgHJoi+bDB
 dP6xy2F97CdMA==
Date: Wed, 6 Jul 2022 22:15:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: Check device status before reading devid
Message-ID: <YsW8Lnhu19Wn2fZJ@matsya>
References: <20220706095644.5852-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706095644.5852-1-srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 stable@vger.kernel.org
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

On 06-07-22, 10:56, Srinivas Kandagatla wrote:
> As per hardware datasheet its recommended that we check the device
> status before reading devid assigned by auto-enumeration.
> 
> Without this patch we see SoundWire devices with invalid enumeration
> addresses on the bus.

Applied, thanks

-- 
~Vinod
