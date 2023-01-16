Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1766BA2D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 10:23:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27CB952BF;
	Mon, 16 Jan 2023 10:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27CB952BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673861019;
	bh=Om4Y2z7UJgoiRKP/p9YeIkNSTG7l9LT/XUQfcMRzkGc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TogPFykqS9pj/4A7kjRluXjgziaxRhzKnv0Kry7CP/MKkz+naIuSoKXN1u20SLw5Y
	 4CnZeKCZHoDI5O4fMl0spIaUjV9RHBY47GN/dzFqrvUdE7cxIWDPIDvkdAS4RGDxfK
	 xF4gx0U/5LMwLLdS7M7QJbC4wwcHkI6GFB7vBFwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C94BCF80083;
	Mon, 16 Jan 2023 10:22:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A92A0F8024C; Mon, 16 Jan 2023 10:22:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40A96F80083
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 10:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A96F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=JDgwXOjF
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B30F36602BBC;
 Mon, 16 Jan 2023 09:22:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673860963;
 bh=Om4Y2z7UJgoiRKP/p9YeIkNSTG7l9LT/XUQfcMRzkGc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JDgwXOjFekfsbgHZX9T8zdvzRiaDx8jWKDlXmNYTUyw/gwHZ7Jdmz1bMux9J4iz62
 H7A0L7dZDj4h496pwJzJtsbaFdIsi5GHMD+pLKVccRqb5RWXa+A8yXPeKC+qPw0PZ7
 +u+pK3t1ZN+DXf5JHRxF93D0tZk9AKDSEzHOIhOoq5EhiHxLGDi554ZZJmDSMHEDe1
 gt9NBKr1BOslSm+CmLPg+3NqHpBQtBbyFvAyMOhKVokWxFVP+Q57frfSbDGTD0WIAl
 35Wm2bKXrbnjsSmsjUHC27hdK5vDpazAeJPjjao50lRYh39keK4UKRcGYiUjl/rwaf
 iXNpaEKuM8mTg==
Message-ID: <c0ee12b0-c509-0215-f266-6d2a5044e572@collabora.com>
Date: Mon, 16 Jan 2023 10:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] ASoC: SOF: sof-audio: skip prepare/unprepare if
 swidget is NULL
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20230113161842.22059-1-peter.ujfalusi@linux.intel.com>
 <20230113161842.22059-4-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230113161842.22059-4-peter.ujfalusi@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 13/01/23 17:18, Peter Ujfalusi ha scritto:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> Skip preparing/unpreparing widgets if the swidget pointer is NULL. This
> will be true in the case of virtual widgets in topology that were added
> for reusing the legacy HDA machine driver with SOF.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

I asked you to add a Fixes tag to this commit before you pushed it.

Please add a Fixes tag.

Regards,
Angelo


