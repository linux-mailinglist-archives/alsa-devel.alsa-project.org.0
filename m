Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF7551FD7
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2D11872;
	Mon, 20 Jun 2022 17:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2D11872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655737743;
	bh=+r2le/0cYQHWtPMNeCxIXB43Y8pcNDHfGVPeVoKPk1w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KCywQficMrVEElv9ZagpmyOdB4bhRq+L4JQTqKd2ryFD9Ex5jKL8DImrJrLS747Kc
	 lldy/jpylb4OQGCbg+Naom0+hOkq1XNbMmc83o4uNixTW7jIaKD9/VcSALHp1RaFoG
	 icnHeC/h2IG5iuPwiJ4UazemYn5yanILpoWLBuO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A81F8053D;
	Mon, 20 Jun 2022 17:06:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D346F8020D; Mon, 20 Jun 2022 01:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB284F8014E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 01:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB284F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.b="fsZl2WzS"; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.b="ncufWiHx"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655681946; x=1687217946;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+r2le/0cYQHWtPMNeCxIXB43Y8pcNDHfGVPeVoKPk1w=;
 b=fsZl2WzSIOuG9NohV+R2zHyd6QtdSuB0Q8dLNxYygjYSfNOgThPHjvRd
 TAIDN2590rc1rgBBxxblB77Aj4Tek3YTvED+USESyUxFZ5NYzSjPuzDOh
 zQhuMW81N/M8lfA1S/gvlpC1aZ3kZU4EHUVDoif355c2Q6dOhW1GUD2g0
 0NC1dJyUc3LBF7LQYSc8vgX5KUGq1Hcoje5YRyU2P5tlrzQbrNyzPdWaQ
 Cu9vR5TWJTH9oP22fCwqeWjyVbn2/BISlqBY+pxj9KRw+DoIyZMUZkHAz
 pOna5TzQ/dO6xml0YylJ29PYWczF9OIbkmUa7zXxSkEPobxo6hIhO8Wh+ w==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; d="scan'208";a="202276608"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 07:38:57 +0800
IronPort-SDR: sc1m2yc/WQK/cm4f32sFqD7b5AB1IBCJkhVlUpPUW31jg6JyVBGkOOGR4/dtuKH08Tz3M7Y99h
 uwlRF5+v1EeZtO88ubdB1lbS/iT9ixrMnprRwszNF5pNMcqrVAxw0+KeePqrWJE8jDbwZcJr5Q
 XxvWv0Y2pPWLRgJslo/wH0b5NVqW3r7Fd6udly06rf8dvJbDCeZlYEXAEEoCLhnf3Fu6EAzibJ
 4jtTTEbp4BrD199/NEDVyKljvgU4rEgJN7kEwuT+71232PEu41kaknhAqyPTEsgs9hZSGElSYt
 vJ9fBpRgduD8vQn8K5/be7dd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 15:57:06 -0700
IronPort-SDR: bwrgLAgORD548bv8lVvddZDp0k9V36Ok4MIQaQ/EVkJC+e6ZxoI4rE9hYq1VN7CEwC8+49v2f6
 uBP7O/6cAEBFYUIs57jrLq1SyJjO5ku9/C+WXBGdia5+wrUjObv3nz01Rlg67z3+pZhU+Na6zO
 MK8l3ew0h4MhlPduD2uGfrg1ANxgbgW32PUQrbTX7pqiOPKKcCWzQ/CMOqB+OrN+csoIxPZ2SE
 47UYLa2MFywWPPFXeNi2yHHhMeal2GADWMr4zOGj+bFmK0SjtWyahZSP6benZ6+E1DpiMVoS6j
 iQ0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 16:38:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LR8PF3hDXz1Rwrw
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 16:38:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655681936; x=1658273937; bh=+r2le/0cYQHWtPMNeCxIXB43Y8pcNDHfGVP
 eVoKPk1w=; b=ncufWiHxkAiUY6DsfL49HY8WqPxxiPw4E3etY84fnNgqBsk9aTE
 I2Svcw/vA4zyBM5Yp/bdSCft0hzw1P3Ws7y43zeKZdP9bWSMnFvzv6UJuBj8rc/n
 UJzFSLARxMV1offyn0IPy8mpsjEvK75FBQYeMGiaErzLl8RxKZ0zdNk0jCta84r2
 4zwNNUFNC44rbwcqGqtCb4FUBzafddqkBwmoDEFt75dmNcmPs1Duwt1K8h4obC++
 rw90sZkCOJ1Nx9BfssCSO0z248q7Ge04Mj0fKkz3Nm22tH8pIoamDT7w44rDZwBM
 o/ApCG13S8sxeTN7YF8cg2+wczbB/s0tZzA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id dv6VQBmWfox8 for <alsa-devel@alsa-project.org>;
 Sun, 19 Jun 2022 16:38:56 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LR8P82TBvz1Rvlc;
 Sun, 19 Jun 2022 16:38:52 -0700 (PDT)
Message-ID: <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
Date: Mon, 20 Jun 2022 08:38:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220618123035.563070-8-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:44 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Heng Sia <jee.heng.sia@intel.com>, linux-spi@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 linux-riscv@lists.infradead.org
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

On 6/18/22 21:30, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 memory node has a compatible string that does not match with
> any driver or dt-binding & has several non standard properties.
> Replace the reg names with a comment and delete the rest.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 44d338514761..287ea6eebe47 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>  
>  	sram: memory@80000000 {
>  		device_type = "memory";
> -		compatible = "canaan,k210-sram";
>  		reg = <0x80000000 0x400000>,
>  		      <0x80400000 0x200000>,
>  		      <0x80600000 0x200000>;
> -		reg-names = "sram0", "sram1", "aisram";
> -		clocks = <&sysclk K210_CLK_SRAM0>,
> -			 <&sysclk K210_CLK_SRAM1>,
> -			 <&sysclk K210_CLK_AI>;
> -		clock-names = "sram0", "sram1", "aisram";
>  	};

These are used by u-boot to setup the memory clocks and initialize the
aisram. Sure the kernel actually does not use this, but to be in sync with
u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
kernel work fine with both u-boot internal DT and the kernel DT.

-- 
Damien Le Moal
Western Digital Research
