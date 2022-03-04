Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C884CCBDA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 03:42:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A96190B;
	Fri,  4 Mar 2022 03:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A96190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646361752;
	bh=XQfX++GIvwC9wIgQpsCWpAmhi+35sae5zs1XenfHqGc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yp8JRNA0HJhXYro6RZZ2wpNEdowkPXY2yytgl0IVc1rWDo9XRNbVhnnDnnYgr2Byr
	 ijNEf4cLhNutQDnTOkp9UyD3m1Ys/yUYWvMJ4+aPcDFgIDRyVn818zStXONTdw1hsY
	 CAdDedXnHTn3E9iKDntKioLoNQrr6+ZgAjZCuxEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC33F80109;
	Fri,  4 Mar 2022 03:41:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A921FF80152; Fri,  4 Mar 2022 03:41:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by alsa1.perex.cz (Postfix) with ESMTP id 1519FF8013D
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 03:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1519FF8013D
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowAC3vNhJfCFiHSYYAg--.7764S2;
 Fri, 04 Mar 2022 10:41:13 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: ckeepax@opensource.cirrus.com
Subject: Re: Re: [PATCH] ASoC: wm8350: Handle error for wm8350_register_irq
Date: Fri,  4 Mar 2022 10:41:12 +0800
Message-Id: <20220304024112.391990-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vNhJfCFiHSYYAg--.7764S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYO7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z2
 80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
 zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
 8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
 xwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
 ZEXa7VU1sYFtUUUUU==
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Mar 03, 2022 at 09:38:34PM +0800, Charles Keepax wrote:
>>  	if (ret != 0)
>> -		return ret;
>> +		goto err;
> 
> I would probably just leave this as a return, nothing is gained
> changing it to a goto.
> 
>>  
>> +	ret = wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_JCK_DET_R,
>>  			    wm8350_hpr_jack_handler, 0, "Right jack detect",
>>  			    priv);
>> -	wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_MICSCD,
>> +	if (ret != 0)
>> +		goto free_JCK_DET_L;
> 
> Probably better to use non-caps here, having caps in a label is a
> little unusual.

Thansk, I have submitted v2 to solve the problems.

Jiang

