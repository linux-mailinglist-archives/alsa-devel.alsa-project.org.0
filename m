Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A46857CE4B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 16:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9CBC17F1;
	Thu, 21 Jul 2022 16:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9CBC17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658415331;
	bh=WHsvqu7hShD6Quppt84R/Z5x1/NTIchqeQJ9NSjFbQM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiP8pfB4uwyAmhxmoxt6DlRBfdIs8NGQk+FUpw6Rg2DxmwxnUtbx2kquX+y/CXMbj
	 qsQak2JRjPrk6qOBi7MyRoSNefN25Qh1qBINWXIh89OpATg0uFbI6Feg0CTrAiEmlC
	 6LQvagt4HybzY1S05LHB4gPxGeAjYm+3JRSXzD3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E2AEF80256;
	Thu, 21 Jul 2022 16:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DEA2F8016D; Thu, 21 Jul 2022 16:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7CF8F800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 16:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7CF8F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="ZBJg7o5f"
Received: from [192.168.1.90] (unknown [188.24.146.105])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D08266601AAA;
 Thu, 21 Jul 2022 15:54:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658415259;
 bh=WHsvqu7hShD6Quppt84R/Z5x1/NTIchqeQJ9NSjFbQM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZBJg7o5flzdNNqPrDOEwtFfxH18TzIO47VjIO4Mx7qf5/sFQSd2aXe5QWCyrAtPAg
 3EScNF0f8dEXcZgLv8OddftcR5S/v/9BRjtm6BJw7Bci46Lb+WfrSsf70BUisLuB6R
 aQQmevF9P4SDn6U86rrHKAHYmYNEGpqkW0t8Tuz8cNmlEQSCTf923OPro8pCG5y4MS
 BwV5NC35UAoQrry0uXOKpUlM5IR7ehnxZlqJNKQemLbshogNp7ItdNCEU1FLWhnlQu
 ncpnDTUOjP4jS78ob4YCMo/aJWD/em4jlEi7KnIQSGj5DzQcD/cCZJs6BPc/XFLjO0
 JkOEG003I77Fw==
Message-ID: <0f413cf5-fadc-6fe8-cadc-2c9526d4a2e2@collabora.com>
Date: Thu, 21 Jul 2022 17:54:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: cs35l41: Set the new legacy DAI naming flag
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20220721121454.1378945-1-cristian.ciocaltea@collabora.com>
 <20220721131928.GD92394@ediswmail.ad.cirrus.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20220721131928.GD92394@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
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

Hi Charles,

On 7/21/22 16:19, Charles Keepax wrote:
> On Thu, Jul 21, 2022 at 03:14:54PM +0300, Cristian Ciocaltea wrote:
>> Unlike most CODEC drivers, the CS35L41 driver did not have the
>> non_legacy_dai_naming set, meaning it uses the legacy naming.
>>
>> The recent migration to the new legacy DAI naming style has broken
>> driver functionality because it is now expected to set the new legacy
>> DAI naming flag in order to instruct the core subsystem to use the
>> legacy name format on DAI registration.
>>
>> Let's fix this by setting the legacy_dai_naming flag accordingly.
>>
>> Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
> 
> It is really not intended for any CODECs to be using the legacy
> DAI naming, it was only intended for platform side components.
> Would be good if you had some details on the affected system and
> if that could be updated to use the non legacy DAI naming?

I'm currently testing this on Valve's Steam Deck. Let me also check what 
would be the required changes in order to switch to using a non-legacy 
DAI naming.

> Thanks,
> Charles
