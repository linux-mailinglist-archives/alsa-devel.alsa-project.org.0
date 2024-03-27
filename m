Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5343894C00
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:00:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA182BEC;
	Tue,  2 Apr 2024 09:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA182BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041221;
	bh=qW/fd5BsHMv42OERGvBEWgfMs2nJ8WYa2Q4ev1Mj2bE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EwGs1eJ50ahG+8h5Y0N+BimRWdqqhk5Fio4a8tCP665bDlWOfysc6DO5C5auLwVsn
	 vgiWTjSediEsW++9nxlpRYml3iYCZ3mHuXG1PU5KQigQ2ACEMF+swuojAgjfN7Ats1
	 c2yzoqx+9f4oBKBtvoveggR8/9S9nX+BzFw0JoyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6B28F805BA; Tue,  2 Apr 2024 08:52:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0197CF8982E;
	Tue,  2 Apr 2024 08:52:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A99CF8025F; Wed, 27 Mar 2024 16:52:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F41F2F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 16:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41F2F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TZTIeM9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711554766; x=1743090766;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qW/fd5BsHMv42OERGvBEWgfMs2nJ8WYa2Q4ev1Mj2bE=;
  b=TZTIeM9aPM4+lMSLhDcUDm2cuVqwTJEWZyyNvtozWywH4vxKfdzvPDhj
   FCHRbzFWMS6mlU/M9eyf3NNoVNvBfbgpDti9HY5Hyck92+DQWSByEhEcy
   4y6r6LBh2MCCVOtla0LU7HYqkUIzrlcT+1gTsFXMP57cQwMdkmEqVPc2b
   2d0w47desXeZ8NM4VMeD1hqzFkH4u9t3Bn1XbBVa7ddZAyOEB4DflyHsg
   fyDQq4PaH2HxIfGgtGm174YtM2v7C6jWiSFSgL6RWBgjsA+T5E+d23GJz
   YAugcILEB7g2+ndqKQu8+6WcuH8panlQyMe8s5el+VZY0pX0NVmbVa+9p
   A==;
X-CSE-ConnectionGUID: sW8IiHbTQMChSf7AzNTvCA==
X-CSE-MsgGUID: YVXFRXWeT0G7ORf9ufx/Iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17302213"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17302213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 08:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="20816491"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.212.56.222])
 ([10.212.56.222])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 08:52:37 -0700
Message-ID: <2757205c-8a58-4619-bed1-d511812d5a18@intel.com>
Date: Wed, 27 Mar 2024 08:52:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] nvdimm: virtio_pmem: drop owner assignment
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-18-0feffab77d99@linaro.org>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20240327-module-owner-virtio-v1-18-0feffab77d99@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: dave.jiang@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OWAAESABGE27U4YCQ5U733QBFEVAJ6BQ
X-Message-ID-Hash: OWAAESABGE27U4YCQ5U733QBFEVAJ6BQ
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:50:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWAAESABGE27U4YCQ5U733QBFEVAJ6BQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/27/24 5:41 AM, Krzysztof Kozlowski wrote:
> virtio core already sets the .owner, so driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Dave Jiang <dave.jiang@intel.com>
> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/nvdimm/virtio_pmem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
> index 4ceced5cefcf..c9b97aeabf85 100644
> --- a/drivers/nvdimm/virtio_pmem.c
> +++ b/drivers/nvdimm/virtio_pmem.c
> @@ -151,7 +151,6 @@ static struct virtio_driver virtio_pmem_driver = {
>  	.feature_table		= features,
>  	.feature_table_size	= ARRAY_SIZE(features),
>  	.driver.name		= KBUILD_MODNAME,
> -	.driver.owner		= THIS_MODULE,
>  	.id_table		= id_table,
>  	.validate		= virtio_pmem_validate,
>  	.probe			= virtio_pmem_probe,
> 
