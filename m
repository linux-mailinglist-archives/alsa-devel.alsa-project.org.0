Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D9B652D18
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 07:58:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D4E9169E;
	Wed, 21 Dec 2022 07:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D4E9169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671605912;
	bh=YKgqfus4hFLWjrvgnrx0rMzsEneYNu3fEArJhxvkyZw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cR+dtaogWbhsvc6Cp8/Y5S0irPGSHuu4OEB61Yk9omkozCB1eDFteUreMoiqArS5W
	 /BE0g0EXylpKR0DO2vcZCMMAPyJRRa/6Rjr9D0znv6djWf5wHQYIpiQJutrilYtV6A
	 srKXCL1EKrUaPEC1GYFh35bDlF71qtAAoRDlWKjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92CEAF801C1;
	Wed, 21 Dec 2022 07:57:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ED60F8047B; Wed, 21 Dec 2022 07:57:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECB18F8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 07:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB18F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fdZ/BGSX
Received: by mail-qk1-x729.google.com with SMTP id k3so6351544qki.13
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 22:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4sxT98fYI+xk8zCUWS+ydCJG4wsKr3bFWOVfVj9faEA=;
 b=fdZ/BGSXYcCSEMqBOsTxHsFUd6wcN4VSsB6nWXZliVj9vHFRUghLogNqLaV5v3K8wl
 jn17WrZsjfQ3rkgBlxh4Tx7mcDh+YEh4uq3O6XemdMI757g3ozdNR11ixOi/kGmu06ho
 Y/C16QV14FDf6PMgX+dl0vx5Ct/pbz6w2nnpNgOyUszVJraMzCuFZOeG/xuGc6O6oYk0
 X4mn6nZf3JKp9XIgcIfj/aX0+2pfl3aJnXH0gvIpPsnlzgKq2CLp3vUmiFUX/zesy10G
 3F52+P5mcDXVUVIBPH7HeK+s9hSZLRZlI2meJyxFCnS52dbWtB1gd3uON7t1tmgqNPGL
 qygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4sxT98fYI+xk8zCUWS+ydCJG4wsKr3bFWOVfVj9faEA=;
 b=1J6vnRh13Fxy+z0j/5s/vJxu1Dy07VsYJn0gby5IB8Pxlz5n808RV47mRbS2j620Np
 chVQz9WmBkFyx2X7Zn4LGC8iW6E/KPLbSQ5GTwkBL0fFR2PkjQDkYdSjZin2DYNLu+OB
 wc7RtodiZje+6ImXsSx8KjtY9YRx41cARtQ6s4d05Ijbcl1jYgHnA5h3GH9SsHkxtdJl
 45MkZphs5Wrkb4xnWwdXnRKrQoM9Gw7kRa8nDmLKmSosV+gTFhk0utxgnaeHZm6QDi+B
 zaH54Sf5xKIgT1k5KPggk6VRda5CIrRv5yEaUl8FIpOsJrVlw0BaOOeoAWg1wATzpXXA
 oTSg==
X-Gm-Message-State: AFqh2krzQpDSdLxXs5eXL5nSkfDvRlMKh/EcyGrJOe7//eEg+pE0MzZJ
 ugAY9F+nukHDq91enLa8nk+cvjGd/1jmW/k7/4w=
X-Google-Smtp-Source: AMrXdXvqGt2iWo9IhQ2GhmhJkyX+ProoR4XL7/tRzJaLbwiQJiZoDGb2ZI/KJPVMoT7k7APh+qkrD/getxaqhjvjUA8=
X-Received: by 2002:a37:592:0:b0:6ff:9cee:cdb7 with SMTP id
 140-20020a370592000000b006ff9ceecdb7mr12532qkf.327.1671605834318; Tue, 20 Dec
 2022 22:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20221220082009.569785-1-hch@lst.de>
 <20221220082009.569785-3-hch@lst.de>
 <alpine.DEB.2.22.394.2212201653520.3532114@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2212201653520.3532114@eliteleevi.tm.intel.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 21 Dec 2022 11:57:03 +0500
Message-ID: <CABXGCsN+oiy_P=LiUDEtOut_Aq2r+aZ5UZWETD-tj+B-b3VF4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dma-mapping: reject GFP_COMP for noncohernt allocaions
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 20, 2022 at 7:58 PM Kai Vehmanen
<kai.vehmanen@linux.intel.com> wrote:
>
> Hey,
>
> On Tue, 20 Dec 2022, Christoph Hellwig wrote:
>
> > While not quite as bogus as for the dma-coherent allocations that were
> > fixed earlier, GFP_COMP for these allocations has no benefits for
> > the dma-direct case, and can't be supported at all by dma dma-iommu
>
> tested the series and this fixes the issue:
> Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>
> Minor nit, typo "noncohernt allocaions" in subject of this second patch.
>
> Br, Kai

I also confirm that after applying this patch series issue was gone.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Thanks.

-- 
Best Regards,
Mike Gavrilov.
