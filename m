Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3463A5F2218
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Oct 2022 10:36:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40BD22A5A;
	Sun,  2 Oct 2022 10:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40BD22A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664699795;
	bh=fzEeaCEz4b7Nafq06ViNPP9BBrASb9GdM1dJ0bBxeyg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghomB+933UGzBQjVmXRiPr+YJTqjgVYDlISD2xiiXZI+jaJqtNXPE+W582FAcbXmv
	 JD5YB7/DRTPiDAipTj1DTaResI7vEdpxFOp/iWKe0sOogII3LZMUaJinezMASupvyy
	 T5Qv/jNpC8rO7Bb6uLtaTtYPNY6JMqVDOU0V7hAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9078F802DB;
	Sun,  2 Oct 2022 10:35:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 997AAF80246; Sun,  2 Oct 2022 10:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A83F800A7
 for <alsa-devel@alsa-project.org>; Sun,  2 Oct 2022 10:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A83F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SIDH0yws"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54823B808D0;
 Sun,  2 Oct 2022 08:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EAAC433B5;
 Sun,  2 Oct 2022 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664699733;
 bh=fzEeaCEz4b7Nafq06ViNPP9BBrASb9GdM1dJ0bBxeyg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SIDH0ywsK6X8/liN5r8QYeG6GB/75JrTTnRQD7cGXhKT/xe32Pt2OBlLEU1VgCJcN
 WGb97qmOzPYywXDQNetOp36j9k9rFmldy2cOg8F9AQKipAc5uH5oKqSz7CU3Nt2Yyb
 fAyCd7SqX+7/dTdbRc0oiNufRnzB8iIsYLAr5VTMwvObXHR5vlbTdb4Kz0lRWcqfud
 XDermtnCZoVsCmMqFz3DBeU3VpCe9ZgxOL/ROse1QTXC8oCQ6Zjfg8HYLzweWuk6x7
 wR+NHYofe2ODahCwNzox4IlTkD5yWV/d/eZmmws59gkkxIW1ZoGjG2gJOuYj2XEano
 lckDxOQtcRBjA==
Message-ID: <a5f9ec49-f921-5efa-6721-d23671ec6bc0@kernel.org>
Date: Sun, 2 Oct 2022 10:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] ASoC: wm8961: add support for devicetree
Content-Language: en-US
To: Doug Brown <doug@schmorgal.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20221001200039.21049-3-doug@schmorgal.com>
 <202210020642.ts8UPw06-lkp@intel.com>
 <a9a94d2d-5379-7e0b-b27c-cad0f569a773@schmorgal.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <a9a94d2d-5379-7e0b-b27c-cad0f569a773@schmorgal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>
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

On 02/10/2022 07:04, Doug Brown wrote:
> On 10/1/2022 3:23 PM, kernel test robot wrote:
> 
>>>> sound/soc/codecs/wm8961.c:974:34: warning: 'wm8961_of_match' defined but not used [-Wunused-const-variable=]
>>       974 | static const struct of_device_id wm8961_of_match[] = {
>>           |                                  ^~~~~~~~~~~~~~~
> 
> Oops, nice catch by the kernel test robot. I will submit a V2 patch that

Now I see the report about issue I wrote to you. It's not particular
nice catch of robot... it's visible from the code and easily testable by
yourself. Even without compile test... The code was just not tested for
warnings.

> does this part exactly how the wm8960 driver does it, including
> .of_match_table in wm8961_i2c_driver. Waiting to see if I get any other
> feedback on V1 first.

maybe_unused instead of ifdefs.

Best regards,
Krzysztof

