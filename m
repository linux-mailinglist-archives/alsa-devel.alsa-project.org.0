Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA648D04B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 02:57:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0741B1C;
	Thu, 13 Jan 2022 02:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0741B1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642039055;
	bh=pc5mjXXq2Wbie5CcpLERffYqZp3Uv2D2NGLR2ia5rZo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X/8ZtPWAJERByEASYat3Kaqz3ms1BX5hlam5XrzNTgmgl4T6uuslBKS1sGtGgLAdQ
	 p/gDaz8UpeU6OFeRl29cXpVInIXZcLUdVSuMY2/MDEkPFfPnyZrMhOR/dzI6cojzOc
	 pjf5FDLb1EfywizBgV89bb4CNs8KLfGsmPSytfa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A273F8026D;
	Thu, 13 Jan 2022 02:56:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9681BF8026A; Thu, 13 Jan 2022 02:56:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by alsa1.perex.cz (Postfix) with ESMTP id D88D3F80236
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 02:56:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D88D3F80236
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowAD3_ye4ht9hf0sdBg--.22540S2;
 Thu, 13 Jan 2022 09:56:08 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: broonie@kernel.org
Subject: Re: Re: [PATCH] ASoC: codecs: Check for error pointer after calling
 devm_regmap_init_mmio
Date: Thu, 13 Jan 2022 09:56:07 +0800
Message-Id: <20220113015607.1124916-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_ye4ht9hf0sdBg--.22540S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry8GF15uF1UtF17WFWfZrb_yoWfXrg_Ww
 4FyF17Cw4UW3ZrJF1DtrnxZr98KF40qrZFyrn8GanxW3s3CFyrAr93u3WfZ34kCrZa9342
 gr4jvF4Iqr13tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
 xVA2Y2ka0xkIwI1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbLiSPUUUUU==
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: cezary.rojewski@intel.com, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@linaro.org
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

On Wed, Jan 12, 2022 at 10:20:34PM +0800, Mark Brown wrote:
>> The devm_regmap_init_mmio() may return error pointer under certain
>> circumstances, for example the possible failure of the kzalloc() in
>> regmap_mmio_gen_context(), which is called by devm_regmap_init_mmio().
>
> This doesn't apply against current code, please check and resend.

I checked linux-5.16, and don't think what I said is not against the
latest code.
The devm_regmap_init_mmio() is defined as devm_regmap_init_mmio_clk()
in `include/linux/regmap.h`.
And in the same file, the devm_regmap_init_mmio_clk() is defined as
__devm_regmap_init_mmio_clk().
Then, __devm_regmap_init_mmio_clk() -> regmap_mmio_gen_context() ->
kzalloc().
So I have no idea what's wrong.
Maybe I didn't write the commit message clear.
Please give me more detail.

Sincerely thanks,
Jiang

