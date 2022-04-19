Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C45067A2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 11:23:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F979172D;
	Tue, 19 Apr 2022 11:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F979172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650360224;
	bh=5HnvdYm+MxcNp1CSTFoRixzcgUTfrbNWTkciH0qr290=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0nSKHXD55R6C5Sbx6HPaz4DtSjpmH2aB/Ujxj3LUp5XJ+olo7+1O0Kci2j6eBjTI
	 9yzeFvKrutVppdSmlueoj/BscQszNd434uv6lR83lkt434Ew/uggPDLPckyJCvYgeu
	 Bhv4DrT5o+KlzW1DQ9CjPSQGuMK3vOurHEbzsXVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8550DF8025D;
	Tue, 19 Apr 2022 11:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9940F8025D; Tue, 19 Apr 2022 11:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11022F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 11:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11022F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="by0FVyX6"
Received: by mail-wr1-x42d.google.com with SMTP id bv16so4419986wrb.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 02:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8P6IeNR1TwtrMg6RsrKfdY4Yo5Rygb5DfiPVUoKhK8=;
 b=by0FVyX6p0zMcvlQP3Y+c8K8TzgSgvcE5pyCF1vetrjvKiBQtCgOwo2ZZWote70zYk
 o9LMkdzdoRmlCNb2amRWJGhf1KdRzvw+TmHMwSj3jdMJksgGdAr/RMXpGiMyCbL3wax2
 91qaPs2u8lB9l4uXPjOarOfRvJX+DT5UFJGrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8P6IeNR1TwtrMg6RsrKfdY4Yo5Rygb5DfiPVUoKhK8=;
 b=GhiH++LAc/d92VL6sfaRvlNd2k9OkUjKvAX0mXdfTOOJ05vwgF2y5+yeKraKtDtkDY
 uOvU3xg6IUGfJ5TzHi0eRd/AHCPuSfZqq0lw6dXoKG9zYFcHBj8nL1W+Wo+ZVmtX9/OK
 KUo+tARb7graEF7FET4epBB2PEyzCmXhU2zPjkaShCAM4Xg1+UuE9iB1kL239jRzMDd7
 gljy17rwTni3T2zLOFFyR0t4gQg0/4aUOE6c6f+VgaByRDUKaYHud4ATjs5JeV9y1Vnd
 yYFH9cGMdO6LjQ3TIdL3wunJ7GuY7G4ODFRdW50ZPdru8xX76Zpx3s8kiMEwYDtetn+z
 ipCQ==
X-Gm-Message-State: AOAM531YdRAHH0z7qDt8s64/c/F/wrrFGnylSSbKQA/o1aID0pM972yo
 17Q5uTU07I3b9VnnVfBprMVdxYWHXNl9IleMj9BDlw==
X-Google-Smtp-Source: ABdhPJzFGn7LU0fqJ7O61lsvDaAZ/2DWIaGN8GbhlNMmxqCmPG3XLkxvdSi+ys256zE0obhK3F0PwBs+L0/P7lP7rrk=
X-Received: by 2002:a05:6000:18c1:b0:207:87dc:94b2 with SMTP id
 w1-20020a05600018c100b0020787dc94b2mr10927908wrq.437.1650360160433; Tue, 19
 Apr 2022 02:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <1649844596-5264-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1649844596-5264-1-git-send-email-quic_srivasam@quicinc.com>
From: Judy Hsiao <judyhsiao@chromium.org>
Date: Tue, 19 Apr 2022 17:22:29 +0800
Message-ID: <CAJXt+b9EKzJ6V2OxYwMiexw2sFhwc0U28XuerC7829ZuHAvghg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Update memremap flag to
 MEMREMAP_WC
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
 quic_plai@quicinc.com, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org
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

> -       buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WT);
> +       buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WC);
Should we replace the memremap() with other standard DMA buffer
allocation API like: snd_pcm_set_managed_buffer() ?
Thanks!
>
>         return 0;
>  }
> --
> 2.7.4
>
