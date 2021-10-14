Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9742DAE2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 15:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322F01696;
	Thu, 14 Oct 2021 15:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322F01696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634219614;
	bh=l7jejWDilA6pTF0R/x4bRTgTts47guQYAhULSrCPeEE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HgA5+aH0DW2y5QNZf5JF/35/EBX1JxArmHOBQrtjUSXg+jmPqrlPxYOUOULWeQBnv
	 ZMQ/kr1N+oidxlPBXeHEgHtZbT3PV9iZ5es1B+XCKWt+X1mPRLNMsbkgrlgcACPAlb
	 KDkjRfiHzjff/C3yrPGJHfBP7zspCnk1SnvZjFas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 512FBF80542;
	Thu, 14 Oct 2021 15:47:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED82F80212; Thu, 14 Oct 2021 10:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 140D9F80088
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 10:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 140D9F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h40uJnzR"
Received: by mail-wr1-x430.google.com with SMTP id g25so16952154wrb.2
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cfakvhen/wxw5fHdRu0DEuLT5DMfJlXe2a/johLjqxo=;
 b=h40uJnzRy4bIKfqfvwm3i/kik60+Kgx2sfXbHxmv0MsZax7HkeDmryc9yctryM7xlU
 37bg2VuoZWdH4kTXGosC95Fa3QYJayYirIbI/UeFVNH/Nzn2/7/VodB6g1hiMuG9zp+p
 egl0Br7pM5vnKxSuUDa7BUq17cmPH9MsIYOosVtDeEDQMUaCZ6h+AWD2esXOH1LRk+zZ
 X2uV1Nn3ulaudun/4f5AT6jS5oilV0myDq9ozSQAqUnytF1YgcEInQmj+cCLjl5OgT5o
 004n5bwSXge4iP3a4skCS8avlQccw5QvPN8BVpAjam8zZmlkvShcDVpQvgmxjplGDMKz
 pkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cfakvhen/wxw5fHdRu0DEuLT5DMfJlXe2a/johLjqxo=;
 b=Wy2kWmkz1vu1OsbmYX9SEXylJ7TBTxZUXgiDjTYPGcgYnxXYDlit1+BPoGHOdnTJGw
 HWUu74igPUM4H9rslOg6//NKlXi7TU73dvuR3y+LQjxuEk8b2vSKtLwcw4jOJzRgQeuq
 pb8Dea+G9nYgu+/Pxv7QgE56hZZosKeg2kW4vDbcgKeVDRDi2U5Wxs1oYktuJ/ii0bfZ
 9y7yrwBaDhFM5ZH63hudogl0dG6f78rKgboqe/K1Rr48zucYIcgqtB7+3Hp9GkZKtPHG
 29mXc3JSPP3/pMFT1cbVDMrPs2MYWFQaWhXud3nvF8KFrHdeqrJY26ZlejM2Bau4MGfM
 G+1Q==
X-Gm-Message-State: AOAM531KFoDOTHoON/LLi6zv7rYMGuBTqd5bG1VvFW5yL5gqpT8FVh7W
 e3+Fla8fLGgfRj2fKr9H/7GFRQ==
X-Google-Smtp-Source: ABdhPJzpVg8OIER+zTALG2ilasSHxD7bC/dTlVAeWBUDgRwrRvN9DCthCd2lRX0ZyZDpw2FTk6Hq6g==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr5151873wrr.386.1634200593067; 
 Thu, 14 Oct 2021 01:36:33 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id r4sm2299114wrz.58.2021.10.14.01.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:36:32 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:36:09 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
Message-ID: <YWfr+Z0wgpQ48yC5@myrica>
References: <20211013105226.20225-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:47:06 +0200
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Dominique Martinet <asmadeus@codewreck.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <vireshk@kernel.org>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 netdev@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
 linux-scsi@vger.kernel.org, Will Deacon <will@kernel.org>,
 v9fs-developer@lists.sourceforge.net,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Linus Walleij <linus.walleij@linaro.org>, Dave Jiang <dave.jiang@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>,
 Gonglei <arei.gonglei@huawei.com>, Kalle Valo <kvalo@codeaurora.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, virtualization@lists.linux-foundation.org,
 Jeff Dike <jdike@addtoit.com>, Vivek Goyal <vgoyal@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, Eric Van Hensbergen <ericvh@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, linux-um@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Jens Axboe <axboe@kernel.dk>,
 Jie Deng <jie.deng@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
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

On Wed, Oct 13, 2021 at 06:55:31AM -0400, Michael S. Tsirkin wrote:
> This will enable cleanups down the road.
> The idea is to disable cbs, then add "flush_queued_cbs" callback
> as a parameter, this way drivers can flush any work
> queued after callbacks have been disabled.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---

>  drivers/iommu/virtio-iommu.c               | 2 +-

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
