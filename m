Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4DE2462C2
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FFF1693;
	Mon, 17 Aug 2020 11:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FFF1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597655945;
	bh=+RD2yN5N1q3un9IT1M50pdc25CeJUXzpLiptrNEMp4I=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snROR3cX7g319fdETGRrxv7hCsvQbpP9tOI9Q2iyeE1dErIsT7LfvEsJxxd/udSci
	 Tb0tGNHO1yhk4anieXBbgrMykjrIBiNJJxo4D2ciVKnoI+mac3EwSMzUJFwNOj0EsA
	 2BbHcFQR19Knt+v32auuDvzxo5Jg/b+u6+5RdpyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2406BF80255;
	Mon, 17 Aug 2020 11:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A59F80218; Mon, 17 Aug 2020 09:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68936F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 09:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68936F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com
 header.b="FbWvaCUj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1597649315; x=1629185315;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+RD2yN5N1q3un9IT1M50pdc25CeJUXzpLiptrNEMp4I=;
 b=FbWvaCUjAxBTYxAEE3iGJcM6+DspW0oZidmbakp/OPLtivW9YiYTo7sN
 ivfcF5WeqhCXLUtD6tdPinAAnXLMO400GNjW3smbYzwlxxMKHxjuVIhFZ
 +VzHPmqSA6H3X/3vS27WZQBgi29U0NV4qxqlWOheMbb9Q5fFKfh15lxLM
 +aohp8mHfYI3/kXTGN/NYNcZr4msMprJ2JOX7Jl1XiFQbZaKhgAPs7JSo
 5QiIOqSdIBPj5MUERoJrMfthkf/ODqNlPgwsmPFpCz7az5T+pHct+fzMO
 qoariUDcXTJfGqmq+lDYERNPohdU9UMiffYPsNdeInrYc5z45Qgy1zyy3 Q==;
IronPort-SDR: jiDMR+V544j3gOce62tFfWKGXrrLqEe/pdjucy+gw24PjZnbDl329ICrdflz8SEFksEsf2k0jV
 54mCnrEMkI6c/MniViVITnAcoy8eKx0GutP6stpU9hnISpJWeJftEEWEXrvQXzZYTtGuqYkRas
 Fmah0qd/0n5Y2jgBxCKMGHuyBpjyuZmFt51gQ/cJ8OiiBPV6+KZ+nXMjJZdUj8jTvq/siUl/Yz
 MyGnkKLE6fCmbZ/eASzZD0PGpr6AyxoACu573PAA0QSL/YljSVQR4qC4u13NB1Y2l0K37WHGff
 NIU=
X-IronPort-AV: E=Sophos;i="5.76,322,1592863200"; d="scan'208";a="26167241"
From: Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To: Robin Gong <yibin.gong@nxp.com>
Subject: RE: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Topic: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Index: AQHWcWQZKYOChL0mPkuCFeZyDJy6mKk3KiiAgABS1/A=
Date: Mon, 17 Aug 2020 07:28:31 +0000
Message-ID: <61498763c60e488a825e8dd270732b62@skidata.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
Accept-Language: en-US, de-AT
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
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

We think this is not an i.MX6-specific problem, but a problem of the DMAeng=
ine usage from the PCM.
In case of a XRUN, the DMA channel is never closed but first a SNDRV_PCM_TR=
IGGER_STOP next a
SNDRV_PCM_TRIGGER_START is triggered.
The SNDRV_PCM_TRIGGER_STOP simply executes a dmaengine_terminate_async() [1=
]
but does not await the termination by calling dmaengine_synchronize(),
which is required as stated by the docu [2].
Anyways, we are not able to fix it in the pcm_dmaengine layer either at the=
 end of
SNDRV_PCM_TRIGGER_STOP (called from the DMA on complete interrupt handler)
or at the beginning of SNDRV_PCM_TRIGGER_START (called from a PCM ioctl),
since the dmaengine_synchronize() requires a non-atomic context.

Based on my understanding, most of the DMA implementations don't even imple=
ment device_synchronize
and if they do, it might not really be necessary since the terminate_all op=
eration is synchron.

With the i.MX6, it looks a bit different:
Since [4], the terminate_all operation really schedules a worker which wait=
s the required ~1ms and
then does the context freeing.
Now, the ioctl(SNDRV_PCM_IOCTL_PREPARE) and the following ioctl(SNDRV_PCM_I=
OCTL_READI_FRAMES),
which are called from US to handle/recover from a XRUN, are in a race with =
the terminate_worker.
If the terminate_worker finishes earlier, everything is fine.
Otherwise, the sdma_prep_dma_cyclic() is called, sets up everything and
as soon as it is scheduled out to wait for data, the terminate_worker is sc=
heduled and kills it.
In this case, we wait in [5] until the timeout is reached and return with -=
EIO.

Based on our understanding, there exist two different fixing approaches:
We thought that the pcm_dmaengine should handle this by either synchronizin=
g the DMA on a trigger or
terminating it synchronously.
However, as we are in an atomic context, we either have to give up the atom=
ic context of the PCM
to finish the termination or we have to design a synchronous terminate vari=
ant which is callable
from an atomic context.

For the first option, which is potentially more performant, we have to leav=
e the atomic PCM context
and we are not sure if we are allowed to.
For the second option, we would have to divide the dma_device terminate_all=
 into an atomic sync and
an async one, which would align with the dmaengine API, giving it the optio=
n to ensure termination
in an atomic context.
Based on my understanding, most of them are synchronous anyways, for the cu=
rrently async ones we=20
would have to implement busy waits.
However, with this approach, we reach the WARN_ON [6] inside of an atomic c=
ontext,
indicating we might not do the right thing.

Ad Failure Log (at bottom):
I haven't added the ioctl syscalls, but this is basically the output with a=
dditional prints to
be able to follow the code execution path.
A XRUN (buffer size is 480 but 960 available) leads to a SNDRV_PCM_TRIGGER_=
STOP.
This leads to terminate_async, starting the terminate_worker.
Next, the XRUN recovery triggers SNDRV_PCM_TRIGGER_START, calling sdma_prep=
_dma_cyclic
and then waits for the DMA in wait_for_avail().
Next we see the two freeings, first the old, then the newly added one;=20
so the terminate_worker is back at work.
Now the DMA is terminated, while we are still waiting on data from it.

What do you think about it? Is any of the provided solutions practicable?
If you need further information or additional logging, feel free to ask.

Best regards
Benjamin


[1] https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_dmaengine=
.c#L209
[2] https://www.kernel.org/doc/html/latest/driver-api/dmaengine/client.html=
#further-apis
[3] https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_dmaengine=
.c#L189
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Db8603d2a5795c42f78998e70dc792336e0dc20c9
[5] https://elixir.bootlin.com/linux/v5.8/source/sound/core/pcm_lib.c#L1875
[6] https://elixir.bootlin.com/linux/latest/source/kernel/dma/mapping.c#L30=
6


*Failure Log from latest 5.4 LTS kernel:*
[  535.201598] imx-sgtl5000 sound: snd_pcm_period_elapsed()
[  535.201610] imx-sgtl5000 sound: snd_pcm_period_elapsed: calls snd_pcm_up=
date_hw_ptr0()
[  535.201626] imx-sdma 20ec000.sdma: sdma_tx_status channel: 2
[  535.201640] snd_pcm_capture_avail: hw_ptr: 960, appl_ptr: 0, avail: 960,=
 boundary: 2013265920
[  535.201655] imx-sgtl5000 sound: snd_dmaengine_pcm_trigger command: 0
[  535.201664] imx-sdma 20ec000.sdma: sdma_disable_channel_async channel: 2
[  535.201672] imx-sdma 20ec000.sdma: sdma_disable_channel channel: 2
[  535.201752] imx-sgtl5000 sound: wait_for_avail: tout=3D999, state=3D4
[  535.201760] imx-sdma 20ec000.sdma: sdma_channel_terminate_work channel: =
2
[  535.201877] imx-sgtl5000 sound: snd_pcm_do_reset: ioctl SNDRV_PCM_IOCTL1=
_RESET
[  535.201888] imx-sgtl5000 sound: snd_pcm_lib_ioctl_reset: calls snd_pcm_u=
pdate_hw_ptr()
[  535.201912] imx-sgtl5000 sound: snd_dmaengine_pcm_trigger command: 1
[  535.201922] imx-sdma 20ec000.sdma: sdma_prep_dma_cyclic channel: 2
[  535.201931] imx-sdma 20ec000.sdma: sdma_config_write channel: 1
[  535.201939] imx-sdma 20ec000.sdma: sdma_config_channel channel: 2
[  535.201948] imx-sdma 20ec000.sdma: sdma_disable_channel channel: 2
[  535.201959] imx-sdma 20ec000.sdma: sdma_load_context channel: 2
[  535.201967] imx-sdma 20ec000.sdma: sdma_transfer_init channel: 2
[  535.201983] imx-sdma 20ec000.sdma: sdma_load_context channel: 2
[  535.201995] imx-sdma 20ec000.sdma: entry 0: count: 256 dma: 0x4a300000  =
intr
[  535.202005] imx-sdma 20ec000.sdma: entry 1: count: 256 dma: 0x4a300100  =
intr
[  535.202014] imx-sdma 20ec000.sdma: entry 2: count: 256 dma: 0x4a300200  =
intr
[  535.202023] imx-sdma 20ec000.sdma: entry 3: count: 256 dma: 0x4a300300  =
intr
[  535.202033] imx-sdma 20ec000.sdma: entry 4: count: 256 dma: 0x4a300400  =
intr
[  535.202042] imx-sdma 20ec000.sdma: entry 5: count: 256 dma: 0x4a300500  =
intr
[  535.202050] imx-sdma 20ec000.sdma: entry 6: count: 256 dma: 0x4a300600  =
intr
[  535.202059] imx-sdma 20ec000.sdma: entry 7: count: 256 dma: 0x4a300700  =
intr
[  535.202067] imx-sdma 20ec000.sdma: entry 8: count: 256 dma: 0x4a300800  =
intr
[  535.202077] imx-sdma 20ec000.sdma: entry 9: count: 256 dma: 0x4a300900  =
intr
[  535.202086] imx-sdma 20ec000.sdma: entry 10: count: 256 dma: 0x4a300a00 =
 intr
[  535.202094] imx-sdma 20ec000.sdma: entry 11: count: 256 dma: 0x4a300b00 =
 intr
[  535.202103] imx-sdma 20ec000.sdma: entry 12: count: 256 dma: 0x4a300c00 =
 intr
[  535.202111] imx-sdma 20ec000.sdma: entry 13: count: 256 dma: 0x4a300d00 =
 intr
[  535.202120] imx-sdma 20ec000.sdma: entry 14: count: 256 dma: 0x4a300e00 =
wrap intr
[  535.202135] imx-sdma 20ec000.sdma: vchan 8aa58994: txd 0a262722[8]: subm=
itted
[  535.202145] imx-sdma 20ec000.sdma: sdma_issue_pending channel: 2
[  535.202181] snd_pcm_capture_avail: hw_ptr: 0, appl_ptr: 0, avail: 0, bou=
ndary: 2013265920
[  535.202192] snd_pcm_capture_avail: hw_ptr: 0, appl_ptr: 0, avail: 0, bou=
ndary: 2013265920
[  535.202202] imx-sgtl5000 sound: wait_for_avail: avail=3D0, state=3D3, tw=
ake=3D64
[  535.203182] imx-sdma 20ec000.sdma: txd 19499aa8: freeing
[  535.203207] imx-sdma 20ec000.sdma: txd 0a262722: freeing
[  545.766059] imx-sgtl5000 sound: wait_for_avail: tout=3D0, state=3D3
[  545.766075] imx-sgtl5000 sound: capture write error (DMA or IRQ trouble?=
)

