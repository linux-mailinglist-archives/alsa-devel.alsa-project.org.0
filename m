Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E741C6752F1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 12:03:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3883111;
	Fri, 20 Jan 2023 12:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3883111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674212617;
	bh=D1HAtBqHAur8JaHevw9CchxdQMYmjJCpCGW+M/tjShU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d88AfYqHR08pxoEXENoolB/EXPNAVwEggVLp28VMSDnOpEeFR3Bm9hsAzuJCjhzcb
	 tOk2y3w9iF/Uw+vwhgHB6DAB/InDJZ1/h89AXpD0hTCOCiVykp/efSq+YrmCUFVgOe
	 I1qPHFxEugj6DAVxgyCchFGtkTu8T059QP47qjUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F61F800F0;
	Fri, 20 Jan 2023 12:02:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63038F8026D; Fri, 20 Jan 2023 12:02:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D188AF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 12:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D188AF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Eh2gJVEn
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E4FB6660230B;
 Fri, 20 Jan 2023 11:02:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674212554;
 bh=D1HAtBqHAur8JaHevw9CchxdQMYmjJCpCGW+M/tjShU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Eh2gJVEnl9CTANbedBJfnefEqIiZbcki65abJSvaucO6ovmqitxOj07kJ1zSr+pJa
 lhIl4WinFUTlp9Wh+weNn7awtx+OCkK7rmwb/o4Suo47ezhavBWi2m6BBMNp2KZGj0
 JmsbLQkNmCoWz0051NeYFCJy8DaEgy1O6JhERv/xKIHCPnMsUkp+VlDTnjak+kLOi+
 o59D2ddNwTodviyO05AAFrD8+CDS7lRR6T66Jj4I26suiAn2bJQP0OSUM1f8YowvPh
 QSbTfDwjfGl+uIUl9aLywgdAEMSK1XmSp8GL6d7XFDLsGg66UVzjh/h1DgfGhXcI8o
 JniLx1Wz6bL+A==
Message-ID: <5ffed624-81e0-ab8c-bf68-84fc700239cc@collabora.com>
Date: Fri, 20 Jan 2023 12:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: SOF: sof-audio: prepare_widgets: Check swidget for
 NULL on sink failure
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, error27@gmail.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-mm@kvack.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 20/01/23 11:21, Peter Ujfalusi ha scritto:
> If the swidget is NULL we skip the preparing of the widget and jump to
> handle the sink path of the widget.
> If the prepare fails in this case we would undo the prepare but the swidget
> is NULL (we skipped the prepare for the widget).
> 
> To avoid NULL pointer dereference in this case we must check swidget
> against NULL pointer once again.
> 
> 
> Fixes: 0ad84b11f2f8 ("ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


