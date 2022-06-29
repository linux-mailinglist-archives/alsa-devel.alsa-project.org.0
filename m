Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D872B56060E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 18:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3F6163C;
	Wed, 29 Jun 2022 18:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3F6163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656521015;
	bh=bPbOCi835UprKA879XALTFC2A2QiLkA5fYyV2bRf1II=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BTwY0jDJuWch84Zku2ijfV0H+7kR6XGil7VVEPNVzlYXJsJSb1w3+QJNTDz566BCX
	 xRXGHP/xn4pd9LL0Swk7fJD5xkTf8n4ikcl/CN3ZEtagFeqLkHbI3bmOdD2iQApGD2
	 mmNQpa/deQMX3w7dV4+NI7TaBGHLilRmwDW+uHuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02210F80245;
	Wed, 29 Jun 2022 18:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13DAFF8020D; Wed, 29 Jun 2022 18:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6539FF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 18:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6539FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XKpcvtAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656520948; x=1688056948;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bPbOCi835UprKA879XALTFC2A2QiLkA5fYyV2bRf1II=;
 b=XKpcvtAiwdr6d20JFNXrEonYgQGkHUJRrwj3hhjYBQaTWxTeM2x+uljg
 ExjByhxXfPf+AwYr4HBFzK1rYeXaOiP0y+GSBPltv7t0aVd4jQm/u+SGQ
 detzwXR4XugiHkW0iuWz6QiP2es+SqW5npkwhqUMrIxTlA9yFNV5dozC3
 7vOn5ZEeXYYZl7E6fqv2FZqtUN7TU3LBIRKrnVn3zu5hW1c94GPGYYlKG
 DuUyYYhYgkZ7DMRLmPERC5TGlIsifPvYSsE26O3dj7N+0r9Zevpb3rHgT
 kkjAn4c4QIZBfarBct3hQVe1ekvH+TAxtIz/C1qErzdsfZniRsljFWvwc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282815572"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="282815572"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:42:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="917668632"
Received: from jwacker-mobl.amr.corp.intel.com (HELO [10.213.178.109])
 ([10.213.178.109])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:42:23 -0700
Message-ID: <57c8a55a-ba27-0b53-e957-657386034e52@linux.intel.com>
Date: Wed, 29 Jun 2022 11:42:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] ASoC: codecs: add wsa883x amplifier support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
 <20220629090644.67982-3-srinivas.kandagatla@linaro.org>
 <352fac7e-597c-84af-d33b-bdff0e2acdb6@linux.intel.com>
 <c12b67b3-2024-2133-9fdb-3d90410a4501@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c12b67b3-2024-2133-9fdb-3d90410a4501@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
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


>>> +static int wsa883x_update_status(struct sdw_slave *slave,
>>> +                 enum sdw_slave_status status)
>>> +{
>>> +    struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
>>> +
>>> +    if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
>>
>> do you actually need to test if slave->dev_num is > 0?
>>
> Few years back I think it was you who asked me to add this check.. :-)
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2073074.html

Oops!

My comment was valid in general but at the bus level. With the benefit
of hindsight, I don't think this comment is valid in this callback.

update_status is either called with UNATTACHED, or with ATTACHED/ALERT
after programming dev_num to a value > 0.

It's not wrong to leave the code as is, but it's likely to be an
always-true condition.
