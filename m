Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867472D200A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 02:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAF01714;
	Tue,  8 Dec 2020 02:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAF01714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607391005;
	bh=xGJi5PhUawzxs4O4fbnN9Dky9ml2flgXknw3Jxhd1rE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFGSl3cHkv5PQyX+7aDFivV4JUDv+S+WP+VszhJyqetQBV5as4A2YB5rpeSm1ooGn
	 ROerHjqJ0Ov541RrBKDqwEuwRik8ZtRuaAE61pSwIJ7tfGN8MgU4CRD0nwVUx78rdG
	 YXVfTjhA9GEUcKOMSolaKIFsKWNnJkowdCb/hgjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8C7F80217;
	Tue,  8 Dec 2020 02:28:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8670BF8020D; Tue,  8 Dec 2020 02:28:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E95BAF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 02:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E95BAF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c+bi86iX"
Received: by mail-pl1-x643.google.com with SMTP id p6so6108417plr.7
 for <alsa-devel@alsa-project.org>; Mon, 07 Dec 2020 17:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g6R21sa3bkOjEnwqhAVxyM+kWVKk9KN5CJ8WQiyRzKg=;
 b=c+bi86iXy/pSBac/0D9EHuYLqSgzndqvSEaxFibcNpweMKyQygRkZzQDEMO+Qw0UxT
 /33sCLHGIDMYobzNYwvDSi74tyY8ITvbbDU0Sk258GTxreVez+owDIlHjtcFzsZa3xix
 ndvhJ1d6ZErYf3EfuNA0LAXY706OqaLr54H27c48TPfhCf0qaS4L6PqOmMCtN1HN3dO1
 QEJZ6vbRb6gjEs93MG4zMFETc25vJntRNgVRpY1n02Py/AK4BmQHWQK+H8sSTwpOHpWn
 XXq5k8unAN/YWq7bTwYRW4BFivBs+VzBJ60omZmbh14WbOjmjjO7/mdsrXwe3+w0Qdr2
 OW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g6R21sa3bkOjEnwqhAVxyM+kWVKk9KN5CJ8WQiyRzKg=;
 b=WC91alXZYb35eIkBBYByQDPzOMKLAxd/eBgVv6d7Yl3D/4Ek7knixhNGGC1jkM6IOI
 nTzn9nrz42ul7NgL3iQzyiTsWM8sl8YfJ920De629OIZKX55pHkxedvpAFkMV/C73lCb
 ZuRJt2Gj9Vo4ukXq0Ps99IrH8DKs7PJG+5PV7m+VEK8IVkScScXo+MSrKhZvZSPFr83F
 XB1y5UoH2S/gNexfrYEGenBq4xyFbZjbkpZsT3c57EfYAdrUiPm2fkAPsAjjirgAA0p+
 4rvsmrNW6mQuDD+SR6XfZ8mbRxy65LVMSTdx/P8h9pNinsZ63XACQFp0axr3r3wo07BZ
 VbvA==
X-Gm-Message-State: AOAM53329dEXt81bwIBonCg1hw/NVH04fGB4c2l2prHZPAD10r6SbDww
 gvLccFZNFpbrT67oBaxqGEk=
X-Google-Smtp-Source: ABdhPJxpxLxNICfqOJ5BiNFYHNzVKl0q1JwFffvvXbpF0tW9FuLkpPPBA+bELyA/XOq2JtoKBTRo5w==
X-Received: by 2002:a17:902:6ac8:b029:da:d645:ab58 with SMTP id
 i8-20020a1709026ac8b02900dad645ab58mr16864544plt.25.1607390896709; 
 Mon, 07 Dec 2020 17:28:16 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a22sm12495382pfa.215.2020.12.07.17.28.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Dec 2020 17:28:16 -0800 (PST)
Date: Mon, 7 Dec 2020 17:25:26 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl: Add imx-hdmi machine driver
Message-ID: <20201208012526.GA21510@Asurada-Nvidia>
References: <1607251319-5821-1-git-send-email-shengjiu.wang@nxp.com>
 <1607251319-5821-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607251319-5821-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Sun, Dec 06, 2020 at 06:41:59PM +0800, Shengjiu Wang wrote:
> The driver is initially designed for sound card using HDMI
> interface on i.MX platform. There is internal HDMI IP or
> external HDMI modules connect with SAI or AUD2HTX interface.
> It supports both transmitter and receiver devices.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
