Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF6190372
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 02:55:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0AA1612;
	Tue, 24 Mar 2020 02:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0AA1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585014927;
	bh=KS4RS+RmLXTkK8iBNmlx1S9JODLxr81lLDoSp3prn1c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7b4EfUx0x45n+2khGH4OACcC9hqVUqzEwvtGzGx3D5/vdn6W9O1+ohRgZssriv7r
	 iwurflEEHrcgjYEq/NWzdmouEcGMAq6+TdNilpgKdJ2PmVlxeMfOrSap2DX4r3fjZl
	 3R5TFw/GMkCJUtdoPbnPDS0mPbrf8MDXssAlCWew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15ED7F80158;
	Tue, 24 Mar 2020 02:53:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDB2AF80158; Tue, 24 Mar 2020 02:53:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E199FF800F6
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 02:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E199FF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iLXX3T4q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="e7aPHb1Z"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 239D55C00E5;
 Mon, 23 Mar 2020 21:53:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 23 Mar 2020 21:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=s19KurUaRp9y9HFnm+TUdll9SE1
 Tn+bMf6OyXxL40jk=; b=iLXX3T4qeYH1O5Hom7A9oaol1oqS5gk6ANYSwA5TKoG
 lA6cPXXc4qdAZhG+dPBsgV+7EMG+kUgEGuA8Au0wqiauOsnl7Qi0GrUv3FrhiP1T
 dycXIgKnSxPMcfeCDrNAYlXH9atmz9W194I8xFnaJ0yoQNMUmPpbIn6Wjt30TEoU
 4L3GPdRHHprInK95UHlx1T8X722ZzJrsXG6V21Or9Lsdooz7S2HP1l18QaOuQKJy
 Fzaeu/6ly0gh9QsyEnx0lk4RUq4dJtB1FdzQEAOvmR5NU6VmmHiNn0GtKp3T4KnV
 S2l7Zqif78CF0FapvddulXpRsAA6pHNndelAceETvRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s19Kur
 UaRp9y9HFnm+TUdll9SE1Tn+bMf6OyXxL40jk=; b=e7aPHb1Z3U7ZG6kyRhtO5i
 faQun6nXxUo9LPAGF9Y1mgt7YlG5Dgms+EosmCoFw87pL2OngrSrWxmD6d04theB
 omNL+qwWnFiDM649HDpvEq2YY101CPRXOWb63FZmL49/FQFrJYPh4pQjVCSKmRaR
 2hXBin9ZDFEjtfIxubq2/+PYNfe22ZsdD1KjOTXfm9AW2rSC+7lNLghjQn6Vet3h
 5BjVZYSjFtkJTdvjDzWaoqLrAAtQlcLZS68Dvd/K0A6ZIn1Dd44nudOth4QNdACp
 L6nj3h3XSEruJS/5i66z3rLf2sdhv2hlgyzdEMO86LNGyRU2WAoU5938keIjdEfA
 ==
X-ME-Sender: <xms:H2h5XvY9PC08Zge6d7ycukOeUgTu14h7QnggpWBFROR1N9LqnahG8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegledgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecukfhppedugedrfedrjeegrdduieeknecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjph
X-ME-Proxy: <xmx:H2h5Xhpulwl6kiz6sbq9HX-slTySyvdEGi-9ZAAyaA16xyejajhvzw>
 <xmx:H2h5XrbAJxfNpseTUQC_RTV2xkdLTJYKudTA0BqUERfjzAljFMflzQ>
 <xmx:H2h5XhQNOnmlLGGMT7G_pVQQNtknozpzjdBB_dT5_vUWbfvv1ZT46Q>
 <xmx:IGh5Xlh0V2mYi7oSC3V-QWc5JLRL2b5tBNg0VMZHw-v4nevasM20mQ>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 357BA30618C1;
 Mon, 23 Mar 2020 21:53:34 -0400 (EDT)
Date: Tue, 24 Mar 2020 10:53:31 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
Message-ID: <20200324015331.GA3679@workstation>
Mail-Followup-To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

Hi,

On Mon, Mar 23, 2020 at 02:36:23PM -0500, Pierre-Louis Bossart wrote:
> Add attribute and show the components string. This is useful to see
> what is provided to userspace and e.g. used by UCM to understand the
> card configuration:
> 
> root@plb:~# more /sys/class/sound/card0/components
> HDA:8086280b,80860101,00100000 cfg-spk:2 hs:rt711 spk:rt1308 mic:rt715
> 
> Note that the style uses what's recommended by checkpatch.pl and is
> slightly different from other sysfs attributes.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/core/init.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
 
I have a concern about this patch in a point of userspace interface.

The 'component' field of 'struct snd_ctl_card_info' is just defined to
have strings with space-separated chunks, and its actual value is not
so fine-documented, thus it's largely different depending of developers
of each driver.

$ cat include/uapi/sound/asound.h
     ...
 941 struct snd_ctl_card_info {
         ...
 950     unsigned char components[128];  /* card components / fine identification, delimited with one space (AC97 etc..) */
 951 };

On the other hand, the node of sysfs is quite common in Linux because
it's tightly coupled to kernel objects. Let you see files under
'Documentation/ABI/'. We can find efforts to maintain sysfs node so
safe and stable. Due to this reason, it's better to take more care when
adding new node.

Would I request you the reason to add this node and the reason that
current ALSA control interface doesn't satisfy your requirement?

> diff --git a/sound/core/init.c b/sound/core/init.c
> index b02a99766351..decaf944a8ad 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -695,9 +695,21 @@ card_number_show_attr(struct device *dev,
>  
>  static DEVICE_ATTR(number, 0444, card_number_show_attr, NULL);
>  
> +static ssize_t
> +components_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%s\n", card->components);
> +}
> +
> +static DEVICE_ATTR_RO(components);
> +
>  static struct attribute *card_dev_attrs[] = {
>  	&dev_attr_id.attr,
>  	&dev_attr_number.attr,
> +	&dev_attr_components.attr,
>  	NULL
>  };
>  
> -- 
> 2.20.1
 

Regards

Takashi Sakamoto
