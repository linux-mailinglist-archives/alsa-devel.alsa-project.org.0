Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD231607204
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 10:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D007C028;
	Fri, 21 Oct 2022 10:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D007C028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666340469;
	bh=llVrGXsJfqbLm53mDOxojmqDZH3LyQYjaTlJpRZmVug=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eDOVx/Nb17YOaNt7pGUJQ8LCmutm8XwTbegddTpf4gTZGaiAhX5HECGem0er08axn
	 +Lp3QUa2gJe1GMHrc922So6x3LFN3TGDtX8jgzTOdBfUCJVUczhAcNjNmVBM3BcA+0
	 peezYVdgJ1XPzJRF0XJJ6DkT40XOwqawju360zUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0563DF80118;
	Fri, 21 Oct 2022 10:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29EB5F800B5; Fri, 21 Oct 2022 10:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52EB8F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 10:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52EB8F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Pljbaf3N"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20221021082006epoutp0252c2dcceb13ecf3a86fb59b6b88fe50d~gB8VRfg1X1287712877epoutp026
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 08:20:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20221021082006epoutp0252c2dcceb13ecf3a86fb59b6b88fe50d~gB8VRfg1X1287712877epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1666340406;
 bh=EteXN5leB+XmcJHL0sfrcjm4GMBmC3l2AK/BOkWFMJM=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Pljbaf3NyNUfgxEap+TYtq9TpeKDYGI7K+BnhaZfEU6CeyZsH56freOXywo9HJCDx
 NqNBt3WhPZ03a2UUeCxEHiQfx38q9qQTGVi8biM6TTODzMAX4FIF/m703uMRlRBwo7
 wwLR+p8+xa2Z1BlzrExS/DP/fsBBXHG6g9Ut4/Bc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20221021082005epcas5p274f7ed038bb09b24040de2a620bb4e30~gB8UsIVCv2087820878epcas5p2C;
 Fri, 21 Oct 2022 08:20:05 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Mty7l54JGz4x9Px; Fri, 21 Oct
 2022 08:20:03 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.26.56352.33652536; Fri, 21 Oct 2022 17:20:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20221021080031epcas5p10588e8f7ebe3b7b79efa340c9f9a7f36~gBrO7TFLO1629516295epcas5p1x;
 Fri, 21 Oct 2022 08:00:31 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221021080031epsmtrp19daf2cfe19f4fe2b41627bd8684dee10~gBrO5-jnS2862728627epsmtrp1N;
 Fri, 21 Oct 2022 08:00:31 +0000 (GMT)
X-AuditID: b6c32a4b-383ff7000001dc20-de-635256335d4f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 99.5F.18644.E9152536; Fri, 21 Oct 2022 17:00:31 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20221021080027epsmtip150a7815cebd9b4c4ca9c3bf6c12073e7~gBrLl28A90171101711epsmtip1m;
 Fri, 21 Oct 2022 08:00:27 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>
In-Reply-To: <Y0lPz91gbovAub9D@sirena.org.uk>
Subject: RE: [PATCH 2/6] ASoC: samsung: i2s: configure PSR from sound card
Date: Fri, 21 Oct 2022 13:30:25 +0530
Message-ID: <04a101d8e523$30804b80$9180e280$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKFI9qd/qMOsyXBjKz4d8Q6MS4QvwJEXTuNARMAzQMCgN8f5qyRLLvA
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMJsWRmVeSWpSXmKPExsWy7bCmhq5xWFCyQftSFYsH87axWVy5eIjJ
 4tDmrewWUx8+YbOYf+Qcq0Xfi4fMFt+udDBZXN41h81ixvl9TBaLtn5ht+jc1c9qMevCDlaL
 1r1H2C0Ov2lntdjwfS2jA7/Hhs9NbB47Z91l99i0qpPN4861PWwe+94uY/Po27KK0WP9lqss
 Hp83yQVwRGXbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
 5gBdr6RQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMCnQK07MLS7NS9fLSy2xMjQw
 MDIFKkzIzni/5wpjQbd8xfWdW1kbGP9IdDFyckgImEjsX7+CsYuRi0NIYDejxKQDfawQzidG
 iQuvdrNAOJ8ZJfb+WMgK07Lo4xsmiMQuRokNTbvZIJwXjBIT1m5lAaliEzCXWLR3KSOILSKg
 LnF000awucwCXcwSG468AyviFNCVeHn7AjuILSzgJXGmZx0ziM0ioCqx5UM/2DpeAUuJ9ydO
 MELYghInZz4B62UWkJfY/nYOM8RJChI/ny4DqucAWuYmcX6HCUSJuMTRnz3MIHslBN5wSPxs
 X8UEUe8i8WfCH6h3hCVeHd/CDmFLSbzsb4Oy8yWmfWxmg7ArJNo+boDqtZc4cGUOC8guZgFN
 ifW79CHCshJTT61jgtjLJ9H7+wlUOa/EjnkwtqrE+uWbGCFsaYl91/cyTmBUmoXks1lIPpuF
 5IVZCNsWMLKsYpRMLSjOTU8tNi0wzksth8d4cn7uJkZw6tby3sH46MEHvUOMTByMhxglOJiV
 RHgL3gUkC/GmJFZWpRblxxeV5qQWH2I0BQb3RGYp0eR8YPbIK4k3NLE0MDEzMzOxNDYzVBLn
 XTxDK1lIID2xJDU7NbUgtQimj4mDU6qB6eXyCcIPpx3pK/9g+sNSUEvl849vR7MOBl/4fDN0
 2sKirOOPe/vMTXbtPujUmfTHXk8w4hIfj8pvm2u3XrCvX2vo6BlepSAxYXOv1mujkkcTtk2W
 v1k895nZ96p/Ryc+m5UuWvvkgNGmp01Ljk5xmHupJdauKvi99vLHGo2n/oQffb/PrTZaRd3/
 4rHU43oqU90+spj43Z2s3f/pDZfgLd7WC5KVwh8DOyXLItqXM/Zsb826/0/3/xsuph/BDizx
 Vam6VRv1nN7s2nCT78lH8VKThXkGkw5rf0lr/rB8D6P9Co4rpwN3RGm+dHnENCE/eUb+ncl2
 O5cXaiYtd440i9Kw2mRxbr/LEx6XgiW8e5RYijMSDbWYi4oTATpEPHtmBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsWy7bCSnO78wKBkg6dzmS0ezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVks2vqF3aJzVz+rxawLO1gt
 WvceYbc4/Kad1WLD97WMDvweGz43sXnsnHWX3WPTqk42jzvX9rB57Hu7jM2jb8sqRo/1W66y
 eHzeJBfAEcVlk5Kak1mWWqRvl8CV8X7PFcaCbvmK6zu3sjYw/pHoYuTkkBAwkVj08Q1TFyMX
 h5DADkaJxgXv2SAS0hLT+/dA2cISK/89Z4coesYosWFxFxNIgk3AXGLR3qWMILaIgLrE0U0b
 WUGKmAVmMEscunWJFaLjEaPErYXzwUZxCuhKvLx9gR3EFhbwkjjTs44ZxGYRUJXY8qGfFcTm
 FbCUeH/iBCOELShxcuYTli5GDqCpehJtG8HCzALyEtvfzmGGuE5B4ufTZawgJSICbhLnd5hA
 lIhLHP3ZwzyBUXgWkkGzEAbNQjJoFpKOBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLz
 czcxgmNXS2sH455VH/QOMTJxMB5ilOBgVhLhLXgXkCzEm5JYWZValB9fVJqTWnyIUZqDRUmc
 90LXyXghgfTEktTs1NSC1CKYLBMHp1QDk5lnLaNLkJvm2ZnzTRnUhTeJlF141tm8Tli2747j
 heLDgjtyrN5WtfqenvBddkN+n2hQ+cF9MpvWnfMP2LP4ceistPDyopO/KjfLTdW+zhVxzbfP
 Y6r4zKh/9+ZIXFsRyDIrSsBAza1uholdy7q0pZde/WHy1Db1ns5q9nhNdUTjui3OFzd+c7zq
 GaWrfmb/TNnkj/kK8hw1869WfZ+flsnrcGzB7vBfb3dHcR2M9P0bYrIq8jC/S/2XhzERzAk/
 BOd8ya0Wlzqtu5Vf6BXLzbX8dz4sarorVqcW8/z+pPXaHALPXNh/ahxw2CD+Ri3NJv9xod2B
 28dOVq+U4d6d5aXVtaHIe5bFOpFTbn1TlFiKMxINtZiLihMB4TkzLUwDAAA=
X-CMS-MailID: 20221021080031epcas5p10588e8f7ebe3b7b79efa340c9f9a7f36
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221014104857epcas5p2a275a1d606ca066227228d13bcf5b120
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104857epcas5p2a275a1d606ca066227228d13bcf5b120@epcas5p2.samsung.com>
 <20221014102151.108539-3-p.rajanbabu@samsung.com>
 <Y0lPz91gbovAub9D@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
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



> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: 14 October 2022 05:32 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> Cc: lgirdwood@gmail.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> alim.akhtar@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com; alsa-devel@alsa-project.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-samsung-
> soc@vger.kernel.org
> Subject: Re: [PATCH 2/6] ASoC: samsung: i2s: configure PSR from sound card
> 
> On Fri, Oct 14, 2022 at 03:51:47PM +0530, Padmanabhan Rajanbabu wrote:
> > Currently the prescaler value in samsung I2S dai is calculated by
> > dividing the peripheral input clock frequency with frame clock
> > frequency and root clock frequency divider. This prescaler value is
> > used to divide the input clock to generate root clock (RCLK) from
> > which frame clock is generated for I2S communication.
> >
> > However for the platforms which does not have a dedicated audio PLL as
> > an input clock source, the prescaler divider will not generate
> > accurate root clock frequency, which inturn affects sampling frequency
> also.
> >
> > To overcome this scenario, support has been added to let the sound
> > card identify right prescaler divider value and configure the
> > prescaler (PSR) divider directly the from the sound card to achieve
> > near accurate sample frequencies
> 
> It's not clear to me why the solution here is to move the configuration to
the
> sound card rather than to improve the I2S driver to be able to cope with
> whatever the restrictions are on the PSR in these systems - it seems more
> cumbersome for system integrators, especially since you've not documented
> the issues or how to configure it.  Could you expand on what the
constraints
> are here and why it's not possible for the driver to figure things out
(given
> some quirk information)?

Thank you for reviewing the patch.

In Samsung I2S CPU controller, to derive the frame clock, we are supposed to
configure the PSR and RFS internal dividers. i.e.

OPCLK -> PSR -> RCLK -> RFS -> Frame clock

Where:
OPCLK - Operational clock
PSR - Operational clock prescaler
RCLK - Root Clock (derived from OPCLK based on PSR)
RFS - Root frequency selection (divider)
Frame clock - Sample frequency (derived from RCLK based on RFS)

Ultimately,

PSR = OPCLK / Frame clock / RFS

Unlike other platforms utilizing Samsung CPU DAI, FSD SoC has a limitation
on
operational clock, where the clock frequency is fixed (66 MHz) and cannot be
modified. 

Assuming that an userspace application wants perform playback @44100 Hz
and assuming that RFS divider value is configured as 256, the PSR value will
yield to

66 MHz / 44.1 KHz / 256 = 5

However if HW uses PSR = 5 to derive the frame clock from operational clock,
then

RCLK = OPCLK / PSR = 66 MHz / 5 = 13.2 MHz
Frame clock = RCLK / RFS = 13.2 MHz / 256 = 51562 Hz

The actual frame clock derived based on PSR is now different from what user
application has intended. The situation did not improve even if the RFS is
swept throughout the entire valid range.

We can overcome this scenario to an extent if we can get a flexibility to
Configure both PSR as well as RFS.

i.e. to achieve frame clock of 44100 Hz, if PSR  = 23 and RFS = 64
then frame clock = 66 MHz / 23 / 64 = 44836 Hz 

Although the sample frequency is not precise, it is very much closer to the
Intended frequency, when compared to that of the existing solution. Since
this
scenario is specific to FSD SoC and has no changes in the Samsung I2S CPU
DAI,
the configuration is being done from the sound card of FSD SoC during
hw_params.

Please let me know if you think this scenario can be approached in any other
way possible, rather than configuring from sound card.

