Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3AF246595
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 13:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 573441687;
	Mon, 17 Aug 2020 13:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 573441687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597664406;
	bh=qAiSySTl/y8QrdoOwS73hqC2vZPrIK22GvC7HIEK8Sw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tDXyTMTQ9YhT1dXUvwa0AmEMtPx2o4nOndu5YcM/0OkkTy69g6X9blb7RpecL+nRi
	 +ruRB0+ilk+0J0gj+RHQ6GVXw/GLS5ecJsm7yudnBu+4/8j9UhL4+lVqWWQMJRQMA/
	 jwFUxViNQusZ4zEO94b3q2DJk0LmYR1fSSjXVWW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77242F800EF;
	Mon, 17 Aug 2020 13:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A2BF80218; Mon, 17 Aug 2020 13:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC07F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 13:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC07F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com
 header.b="V3ApX3ce"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1597664298; x=1629200298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qAiSySTl/y8QrdoOwS73hqC2vZPrIK22GvC7HIEK8Sw=;
 b=V3ApX3cefSTleR4JFzaTGtdru6ij2KRHasqR89qARCt+1zxjnvQinhVW
 9eMC+i9W4HDU08N5fIOPnf7XSkjZR51xX7d4ui72ITYsJiguUDsplmRiH
 ErTkT1S7dO/TDwmZy3QRfaH/+Syl4k0lMGYfc/0Ib2YgfuO1eNraR1GZo
 vgCrZqO1eH/GFIxcMdCzE5X0b1Ae17CwpSiAMu9f8WUJazfFnC9yzjxCx
 xQfTy4mPndzm/rPa4qcsbosklvDc/1nHV9IVNn4pq9OPzTzG34QPN4733
 Iwy/3cAZcdbOTOUPFJ0uOgjeK9qhZmDlSXBgBb03LeyQmgQ8LPPOsw8UY A==;
IronPort-SDR: r14hO/kLklIsGQ2dnpEN7qM09P2f2aF1EjhAlxzmSMcuqfvXFBRe+N2g2GbNAQy6RBnH6mvub4
 G9CzTCq5/0Xu34vgrQoODE4XvobffdAgUcNAoI/Wd3UL6Jq51FS5mK4HdyazyQntye83cu6C1d
 Utxs08P5rh1ovPmRJnbqt32sNVRq/vBpgr26ga+RPc5pxsLbfheQqpxpsN6+Av0kB6MiwftAt7
 /fB6w62Tw9zJn1oFUf2wPuRXpstyhH7KMAs9dQhCYg8DlQFi2903uhUeTmOramaYOuZ2OpH0lA
 PAs=
X-IronPort-AV: E=Sophos;i="5.76,322,1592863200"; 
   d="scan'208";a="2642801"
From: Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To: Robin Gong <yibin.gong@nxp.com>
Subject: RE: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Topic: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Index: AQHWcWQZKYOChL0mPkuCFeZyDJy6mKk3KiiAgABS1/CABG6hAIAARo2Q
Date: Mon, 17 Aug 2020 11:38:10 +0000
Message-ID: <a64ae27d9f1348ecae6adc74969cc88c@skidata.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
 <VE1PR04MB6638AC2A3AE852C3047E7B97895F0@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6638AC2A3AE852C3047E7B97895F0@VE1PR04MB6638.eurprd04.prod.outlook.com>
Accept-Language: en-US, de-AT
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

> -----Original Message-----
> From: Robin Gong <yibin.gong@nxp.com>
> Sent: Montag, 17. August 2020 11:23
> busy_wait is not good I think, would you please have a try with the attac=
hed patch
> which is based on https://lkml.org/lkml/2020/8/11/111? The basic idea is
> to keep the freed descriptor into another list for freeing in later termi=
nate_worker
> instead of freeing directly all in terminate_worker by vchan_get_all_desc=
riptors
> which may break next descriptor coming soon

The idea sounds good, but with this attempt we are still not sure that the =
1ms
(the ultimate reason why this is a problem) is awaited between DMA disablin=
g and
re-enabling.

If we are allowed to leave the atomic PCM context on each trigger, synchron=
ize the DMA and then
enter it back again, everything is fine.
This might be the most performant and elegant solution.
However, since we are in an atomic context for a reason, it might not be wa=
nted by the PCM system
that the DMA termination completion of the previous context happens within =
the next call,
but we are not sure about that.
In this case, a busy wait is not a good solution, but a necessary one,
or at least the only valid solution we are aware of.

Anyhow, based on my understanding, either the start or the stop trigger has=
 to wait the 1ms
(or whats left of it).

