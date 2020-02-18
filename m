Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4141162F2C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 19:58:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648FF1699;
	Tue, 18 Feb 2020 19:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648FF1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582052333;
	bh=PIroewA9CRewW2uEMF3WB0hu2+/MduyWbDwI0el4YG8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqnq0P+zFV4VudZET6fXEUkJ2ogg2+ZZKVC5bf94xLuYq0yzvB5cBpU1udkggcIjD
	 uxXBip02Em8IdTkYQXo9E/ZIaa8Q22xr5VRVCZ6K6ZL91nShnxlf1T3Vu7c6VxN6L9
	 WBYrPFDIToi05tkYjkZhi2OrdOqIaNfvEV69bc+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61878F8014A;
	Tue, 18 Feb 2020 19:57:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83221F800C4; Tue, 18 Feb 2020 19:57:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF2F0F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 19:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF2F0F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z+vOz7ZS"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IIv4AT108923;
 Tue, 18 Feb 2020 12:57:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582052224;
 bh=lg/2Z6zca55Iu7jvMKJqSywmZdemYSmrtaUYfeNcE7M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Z+vOz7ZS7gut4Dor2Y7wFP7TzZRCGlKyp/WI42DHESu/+pb9F7FGCJ1V56vQ/klNO
 X/KMNTqyLgCLNgVKoj4JI3TGVjmhyPmnlcueD34g3yQjUDAvzNvkkz77CZBJMi5zFz
 6N9pI3PPPoX2zhLS1xVWMWaJ1saaZ4T6qzXLp2ms=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IIv3wf023051
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Feb 2020 12:57:03 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 12:57:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 12:57:03 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IIv3qu066914;
 Tue, 18 Feb 2020 12:57:03 -0600
Subject: Re: [PATCH] ASoC: tas2562: Return invalid for when bitwidth is invalid
To: Mark Brown <broonie@kernel.org>
References: <20200218174706.27309-1-dmurphy@ti.com>
 <20200218184832.GL4232@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <89e205b4-ba03-8db6-ff75-acec3d954b52@ti.com>
Date: Tue, 18 Feb 2020 12:52:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218184832.GL4232@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

Mark
On 2/18/20 12:48 PM, Mark Brown wrote:
> On Tue, Feb 18, 2020 at 11:47:06AM -0600, Dan Murphy wrote:
>> If the bitwidth passed in to the set_bitwidth function is not supported
>> then return an error.
>>
>> Fixes: 29b74236bd57 ("ASoC: tas2562: Introduce the TAS2562 amplifier")
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   scripts/conmakehash        | Bin 0 -> 13120 bytes
>>   scripts/sortextable        | Bin 0 -> 18040 bytes
>>   sound/soc/codecs/tas2562.c |   3 ++-
>>   3 files changed, 2 insertions(+), 1 deletion(-)
>>   create mode 100755 scripts/conmakehash
>>   create mode 100755 scripts/sortextable
>>
>> diff --git a/scripts/conmakehash b/scripts/conmakehash
>> new file mode 100755
>> index 0000000000000000000000000000000000000000..17eec37019b8ae45f42f3c82046d1a55a6f69cb3
>> GIT binary patch
>> literal 13120
>> zcmeHOeQ;D&mcN}25CU`u1i`Q23C#=v(j@XB0Wx-n4!le?@~!SFHl6fK(rc$X+x=RD
> This is...  fun?  I'm guessing it's not intentional, it's certainly a
> litt

Ugh! Resending without the extra files.

Dan

> le difficult to review.  :)
