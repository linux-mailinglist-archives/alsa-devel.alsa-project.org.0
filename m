Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D3B8FDC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 14:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAB3167A;
	Fri, 20 Sep 2019 14:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAB3167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568982910;
	bh=AACWFMYLm1JY3RNVr1q02inbsYAU4/3qGVJAB+Bmqw4=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6hwkoOd6L4xikpPy5PU4eMplqCDs+kk3N51uitVgvRceX0Csfse1b3C3M32mONJw
	 sluyX4vOGRy8avQEokR3+8gFi2Sd2nbRUsZQ4gUEs4vS3BdpMwvNgGBCmzH3ilkivY
	 d6wUZsFcvo91w8Q3Rd3ovuuOI8j8z0GK/KZb0OR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B9C2F80527;
	Fri, 20 Sep 2019 14:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B364CF80506; Fri, 20 Sep 2019 14:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CB7DF800C7
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 14:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB7DF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="HnbF0iht"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920123317euoutp02d86cf45231cb4d29eb08c255c8dfe7a6~GJYqX9qA20755807558euoutp02D
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 12:33:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190920123317euoutp02d86cf45231cb4d29eb08c255c8dfe7a6~GJYqX9qA20755807558euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568982797;
 bh=An6IFMuJWXuwxVdiKy4QPVNtQOtB1Ur8iinVcxvRah0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=HnbF0ihtYIDj9GE+YpUHwUz21XCPLbiEMowDsOpKSyvXOdMlUk+TtEoQUVzFFXbR8
 HL58BSjGkkQkx4NwWUxgzfkICnqLEY7btRpFHTVkiRkX9/p9Y7nj9FCyVetoX5YYFn
 vwUlhSa8CxAKsVkGI1XYobLw1F0YJLyzJVBz3gJY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920123316eucas1p207d0dd477e1eae59f3abdcd8a8c3c27e~GJYp1YaAX0105301053eucas1p2S;
 Fri, 20 Sep 2019 12:33:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 61.66.04374.C07C48D5; Fri, 20
 Sep 2019 13:33:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190920123315eucas1p13573d58c030e7e256076cd083b689f07~GJYoyD08J1369713697eucas1p1Q;
 Fri, 20 Sep 2019 12:33:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920123315eusmtrp212a53bf7a8cfae7995daa57de35d78b5~GJYoxXv-72446524465eusmtrp2c;
 Fri, 20 Sep 2019 12:33:15 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-0c-5d84c70ccb87
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.2D.04117.B07C48D5; Fri, 20
 Sep 2019 13:33:15 +0100 (BST)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190920123315eusmtip1ef618e539e4ccf61fed544f7348fd629~GJYoNFyJe0063900639eusmtip1G;
 Fri, 20 Sep 2019 12:33:15 +0000 (GMT)
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <68ec938a-29b5-0c07-3a5e-771d6ce587b4@samsung.com>
Date: Fri, 20 Sep 2019 14:33:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920122616.GA26862@pi3>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRT2t7v7cDm7TmMHnRXDBKN89ICLpWQU7J8gsIIyyak3Nbcpm5oW
 lO/HFC0p0iWuAvORLhExNRKa4hJzywdagi8QDMuslpW5rG1Xy/++75zvnO98cChMNIh7U0mq
 NFatkiukhIDf0b9q2e9myo8OnjFImEmDGWfGho085u7cPMHo++zUYmklme9jxTxmtLuGYKos
 PTxmNs9AMHUTwzym4EUfyfR+LMKPuclarbmErLm2Gcm6dFOkrK2phJCVtzchmbVt52niguBo
 PKtIymDVQeExgsQPuhY89c6ZzCFtJ5GNTBFa5EoBfQg+90/xtEhAiegGBJU5gzhHviFomFvG
 OGJF0Nm+zNscMec/3lDVIzCv20iOLCHoGF/hO1Se9HnIqcgjHNiLDoCJ3z+cExh9G4P7ZSXO
 BkGHgHZJ68RCOhxyFqpxB+bTe2CyW0868A46GqZ/mjBO4wED1fNOA1f70ormNedJGL0Lni3V
 YBwWw+S83pkI6EkS2ovf49zdJ6BgaJzksCcsmto3sAT+dG0O5CGYM7eQHClDMJpbhTjVEeg1
 Dds3UXaLAHjaHcSVI6CiSMt3lIF2h7dLHtwR7lDZcQ/jykIoLhRxan/QmQz/bF++GcFuIalu
 SzTdlji6LXF0/30fIH4TErPpGmUCqzmoYq8GauRKTboqITAuRdmG7C82uG5a6UQ9tlgjoikk
 dRPK+vOjRbg8Q5OlNCKgMKmXsOZwbrRIGC/PusaqUy6p0xWsxoh8KL5ULLzuMhslohPkaWwy
 y6ay6s0uj3L1zkZiW+6jVxKXm4ryLin5/Mspv3grXjlyOfakn3dThDbZZthXGpldGhPY//V4
 Q/3uwrBPfVOJHWdXuyIFdeqHfuFPon6JdcbtfO/pcwuvZxddBg6sbWMu3pAQvlfKggvyBxvD
 MFtjSIQ+wC2mWqkAr9qZuOnhKB9JqLvvO1deZqi/lK9JlIfsxdQa+V+wlSL/XgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xu7rcx1tiDVbsVbK4te4cq8WVi4eY
 LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLJZev8hk0br3CLvF4TftrA48
 Hhs+N7F5rJm3htFj56y77B6bVnWyefRtWcXo8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6h
 pYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G61lrWQumhFSc7drB1sB43LGLkZNDQsBE
 4lzLMlYQW0hgKaPE1v1lEHEZiZPTGlghbGGJP9e62LoYuYBqXjNKfFmwDywhLBApseFHBzuI
 LSKgKXH973dWkCJmgcnMEu93nmaF6PjOKDF7RQtYFZuAoUTXW5BRnBy8AnYSjc9ngk1iEVCV
 uLVrPlANB4eoQKzEpr1mECWCEidnPmEBsTmBFvSv+c0EYjMLmEnM2/yQGcKWl9j+dg6ULS5x
 68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbstmM/
 t+xg7HoXfIhRgINRiYfX41hLrBBrYllxZe4hRgkOZiUR3jmmTbFCvCmJlVWpRfnxRaU5qcWH
 GE2BfpvILCWanA9MJnkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODil
 Ghg5Lhe1Ff47cfio9yfZBYHMapn9E+b9DbJQtNfn7Ar6WnHtapzI2UuNnLGdhe1JB5deilss
 xmTcpv51weeAqkKucnXl1g+/82c0XRLPc13Ss8W40HBBX2fNcl4THs7N86xKJLZonvBcdEGq
 NCxEurvyYWyt5P/Ze+LXHGSdrKji8Yv9GcenZCWW4oxEQy3mouJEAPmhlqvuAgAA
X-CMS-MailID: 20190920123315eucas1p13573d58c030e7e256076cd083b689f07
X-Msg-Generator: CA
X-RootMTR: 20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319@eucas1p2.samsung.com>
 <20190920113540.30687-1-m.szyprowski@samsung.com>
 <20190920122616.GA26862@pi3>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v3] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Krzysztof,

On 20.09.2019 14:26, Krzysztof Kozlowski wrote:
> On Fri, Sep 20, 2019 at 01:35:40PM +0200, Marek Szyprowski wrote:
>> From: Maciej Falkowski <m.falkowski@samsung.com>
>>
>> Convert Samsung I2S controller to newer dt-schema format.
>>
>> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> v3:
>> - Removed quotation marks from strings in compatible property
>> - Added min/max items to dmas property
>> - Removed unneeded description from dma-names property
>> - Added specific dma-names
>> - Added clock description
>> - Added include directive to examples to use clock macros directly
> Guys, please stop attaching new versions of entire patchset to existing
> discussions with in-reply-to. Entire V2 was attached to V1. V3 is
> attached here. On some mail clients (GMail) this does not mark entire
> thread unread at it looks like someone just commented about something.
> Some other clients, e.g. mbsynsc with GMail, do not sync entire thread
> so new version looks like reply-to but attached to nothing (missing
> context). Not mentioning that you need additional effort on your side to
> copy+paste the in-reply-to ID.
>
>> ---
>>   .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>>   .../bindings/sound/samsung-i2s.yaml           | 135 ++++++++++++++++++
>>   2 files changed, 135 insertions(+), 84 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
>> deleted file mode 100644
>> index a88cb00fa096..000000000000
>> --- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
>> +++ /dev/null
>> @@ -1,84 +0,0 @@
>> -* Samsung I2S controller
>> -
>> -Required SoC Specific Properties:
>> -
>> -- compatible : should be one of the following.
>> -   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
>> -   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
>> -     secondary fifo, s/w reset control and internal mux for root clk src.
>> -   - samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
>> -     playback, stereo channel capture, secondary fifo using internal
>> -     or external dma, s/w reset control, internal mux for root clk src
>> -     and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
>> -     is to allow transfer of multiple channel audio data on single data line.
>> -   - samsung,exynos7-i2s: with all the available features of exynos5 i2s,
>> -     exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
>> -     with only external dma and more no.of root clk sampling frequencies.
>> -   - samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
>> -     stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
>> -     slightly modified bit offsets.
>> -
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -- dmas: list of DMA controller phandle and DMA request line ordered pairs.
>> -- dma-names: identifier string for each DMA request line in the dmas property.
>> -  These strings correspond 1:1 with the ordered pairs in dmas.
>> -- clocks: Handle to iis clock and RCLK source clk.
>> -- clock-names:
>> -  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
>> -  clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
>> -  "i2s_opclk1" as shown in the example below.
>> -  i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
>> -  be "iis" and "i2s_opclk0".
>> -  "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources of the root
>> -  clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
>> -  doesn't have any such mux.
> I think you still miss this description of clocks and Sylwester asked for it.
>
>> -- #clock-cells: should be 1, this property must be present if the I2S device
>> -  is a clock provider in terms of the common clock bindings, described in
>> -  ../clock/clock-bindings.txt.
>> -- clock-output-names (deprecated): from the common clock bindings, names of
>> -  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
>> -  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices respectively.
> You missed this. If you decide to remove deprecated properties, then
> make it in separate patach. You described this patch as pure conversion
> so I expect no logical/functional changes.
>
>> -
>> -There are following clocks available at the I2S device nodes:
>> - CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
>> - CLK_I2S_RCLK_PSR - the RCLK prescaler divider clock (corresponding to the
>> -		    IISPSR register),
>> - CLK_I2S_RCLK_SRC - the RCLKSRC mux clock (corresponding to RCLKSRC bit in
>> -		    IISMOD register).
>> -
>> -Refer to the SoC datasheet for availability of the above clocks.
>> -The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
>> -in the IIS Multi Audio Interface.
>> -
>> -Note: Old DTs may not have the #clock-cells property and then not use the I2S
>> -node as a clock supplier.
>> -
>> -Optional SoC Specific Properties:
>> -
>> -- samsung,idma-addr: Internal DMA register base address of the audio
>> -  sub system(used in secondary sound source).
>> -- pinctrl-0: Should specify pin control groups used for this controller.
>> -- pinctrl-names: Should contain only one value - "default".
>> -- #sound-dai-cells: should be 1.
>> -
>> -
>> -Example:
>> -
>> -i2s0: i2s@3830000 {
>> -	compatible = "samsung,s5pv210-i2s";
>> -	reg = <0x03830000 0x100>;
>> -	dmas = <&pdma0 10
>> -		&pdma0 9
>> -		&pdma0 8>;
>> -	dma-names = "tx", "rx", "tx-sec";
>> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
>> -		<&clock_audss EXYNOS_I2S_BUS>,
>> -		<&clock_audss EXYNOS_SCLK_I2S>;
>> -	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
>> -	#clock-cells = <1>;
>> -	samsung,idma-addr = <0x03000000>;
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&i2s0_bus>;
>> -	#sound-dai-cells = <1>;
>> -};
>> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
>> new file mode 100644
>> index 000000000000..20ae5da7f798
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
>> @@ -0,0 +1,135 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung SoC I2S controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
>> +
>> +properties:
>> +  compatible:
>> +    description: |
>> +      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
>> +
>> +      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
>> +      secondary fifo, s/w reset control and internal mux for root clk src.
>> +
>> +      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
>> +      playback, stereo channel capture, secondary fifo using internal
>> +      or external dma, s/w reset control, internal mux for root clk src
>> +      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
>> +      is to allow transfer of multiple channel audio data on single data line.
>> +
>> +      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
>> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
>> +      with only external dma and more no.of root clk sampling frequencies.
>> +
>> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
>> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
>> +      slightly modified bit offsets.
>> +    enum:
>> +      - samsung,s3c6410-i2s
>> +      - samsung,s5pv210-i2s
>> +      - samsung,exynos5420-i2s
>> +      - samsung,exynos7-i2s
>> +      - samsung,exynos7-i2s1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  dma-names:
>> +    oneOf:
>> +      - items:
>> +          - const: tx
>> +          - const: rx
>> +      - items:
>> +          - const: tx
>> +          - const: rx
>> +          - const: tx-sec
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +    description: |
>> +      There are following clocks available at the I2S device nodes:
>> +      CLK_I2S_CDCLK:
>> +      the CDCLK (CODECLKO) gate clock.
>> +
>> +      CLK_I2S_RCLK_PSR:
>> +      RCLK prescaler divider clock corresponding to the IISPSR register.
>> +
>> +      CLK_I2S_RCLK_SRC:
>> +      RCLKSRC mux clock corresponding to RCLKSRC bit in IISMOD register.
>> +
>> +  clock-names:
>> +    oneOf:
>> +      - items:
>> +          - const: iis
>> +      - items:
>> +          - const: iis
>> +          - const: i2s_opclk0
>> +      - items:
>> +          - const: iis
>> +          - const: i2s_opclk0
>> +          - const: i2s_opclk1
>> +    description: |
>> +      "iis" is the i2s bus clock.
>> +      For i2s1 and i2s2 - "iis", "i2s_opclk0"
>> +      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  samsung,idma-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Internal DMA register base address of the audio
>> +      sub system(used in secondary sound source).
>> +
>> +  pinctrl-0:
>> +    description: Should specify pin control groups used for this controller.
>> +
>> +  pinctrl-names:
>> +    const: default
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - dmas
>> +  - dma-names
>> +  - clocks
>> +  - clock-names
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/exynos-audss-clk.h>
> Does it really work? When I tried, it was failing... If you look up at
> resulting DTS example it is wrong.

In which way it was wrong? We checked and it was correctly propagated to 
the example dts. It also compiled fine without errors. The only minor 
issue was that the include was generated inside the root node, but for 
the clock definitions this doesn't matter, but it makes the example 
easier to understand.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
