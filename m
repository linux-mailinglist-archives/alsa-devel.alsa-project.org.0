Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54784F31D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2019 03:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28CF1846;
	Sat, 22 Jun 2019 03:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28CF1846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561167445;
	bh=7fnU8VX/B3KVH3ylh6TZg/WaM4tzqFPm0CYPacbO+PI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rl0k+YaFYddyk8sB6GpzLoEaFRHfGiSfD8vSv8uew2cRfHg60OKgJEVntkt45RoG8
	 i4i0NjxHamt8+fhRYGtCyF8yT6pu5wtMTZeJHunmPzP/lsn7T09O04nfue2VUq1i5Z
	 m0PnQ5fqX7PeBfxzCCEtKjSvZwgsR+DZ7TM34GA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 811EAF89717;
	Sat, 22 Jun 2019 03:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C55A6F89717; Sat, 22 Jun 2019 03:35:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53D08F8071F
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 03:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D08F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pMkbxO4o"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ICcyBzJd"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 82CA62224E;
 Fri, 21 Jun 2019 21:35:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 21 Jun 2019 21:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=d0G2kQ7Dy61LivDtC00cdZLmLIB
 VYBP5gLzFk1MJBt8=; b=pMkbxO4oN+qaCLCIITpAKMAWO7GAdWYFhZjs4lSQ/bJ
 WGFEEVPdbUM2qJyjdGOkso5iJnTOmalppGctjs0oFa3zskvMhK9FySIOzi0Kt53L
 /5DZA5B/TWLi8Fe8768+Ji/vQl0kGLOuiGXgNX5Q5HhUfFNmpwZQKjg41AdhiCox
 tA8zyonavIiy4yCzyZw4Z/N/MVFBaj3oL2qiTTgVgP0BuNQIRZ+QEr+zailM3wwu
 eiFfYDlggb0RKubGqaiziQ8WqS31wAu5kofn0r8YqOW0Ca3Wh61dEfaDMU9TKvDh
 BOdhfJ8eiUtxGVFIRdpXfRmo+OyN+qNh69je2VWTqmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=d0G2kQ
 7Dy61LivDtC00cdZLmLIBVYBP5gLzFk1MJBt8=; b=ICcyBzJd8xTlVdkgyEmY/6
 Dhz9xcgE2mpKh7LH4dKhEDvdEMRW9zoLLvPhUnJniJ12uQT6iEMzzif/1A5jZ4FW
 T8YHCR1pQipbqG6FeabHjmIRNaSx2fmG1OQcFQhNQZONxmPbhoDX++sstVAqsrkE
 6x9srOl6HfsPUxUGEsrL4enL8kfHEykQaM10vamJDa8bl+jZyqLfH/XZv5+oy8yi
 Xm1WvvnKpyPiQDM7/UowdMncw5ATA5Az/UOgFy0feQSKBWLKT/fVpF9VL0g3uZsn
 vx1pDOWn0Ec0GCwCH6bNeKim1C6t2aJ/WJhXcl/HAMVCvGb/KJtAeMovkUS2HItw
 ==
X-ME-Sender: <xms:3oUNXVvf73jsrcfA3R9ocAWmrEPBYROW5wrUVX8cCliY4gfClORYow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdejgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhep
 ohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:3oUNXTvlsOG2SEODEkVbMaCsU-mwvfUxEfWM9K8meXYL9u3McK_F7w>
 <xmx:3oUNXac7PFvxmXY4-AGDB6TBBzvFEsKd1FrZFOjm37lD4Mq2nCmWjg>
 <xmx:3oUNXUZmevrVcfCSdXXQwISWBP23jmkLerohiCX13F6iofEuAxO9pA>
 <xmx:34UNXXaBdOcKFRvEwpLOg_uGT3RDIV0OveDmihF7a58pkWWN8869Uw>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB75A8005A;
 Fri, 21 Jun 2019 21:35:25 -0400 (EDT)
Date: Sat, 22 Jun 2019 10:35:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20190622013522.GA14635@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org
References: <20190619101639.GA29913@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619101639.GA29913@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [bug report] ALSA: oxfw: configure packet format
 in pcm.hw_params callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, Jun 19, 2019 at 01:16:39PM +0300, Dan Carpenter wrote:
> Hello Takashi Sakamoto,
> 
> The patch 4f380d007052: "ALSA: oxfw: configure packet format in
> pcm.hw_params callback" from Jun 12, 2019, leads to the following
> static checker warning:
> 
> 	sound/firewire/oxfw/oxfw-stream.c:357 snd_oxfw_stream_start_duplex()
> 	warn: 'oxfw->rx_stream.buffer.packets' double freed
> 
> sound/firewire/oxfw/oxfw-stream.c
>    317  int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
>    318  {
>    319          int err;
>    320  
>    321          if (oxfw->substreams_count == 0)
>    322                  return -EIO;
>    323  
>    324          if (amdtp_streaming_error(&oxfw->rx_stream) ||
>    325              amdtp_streaming_error(&oxfw->tx_stream)) {
>    326                  amdtp_stream_stop(&oxfw->rx_stream);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>    327                  cmp_connection_break(&oxfw->in_conn);
>    328  
>    329                  if (oxfw->has_output) {
>    330                          amdtp_stream_stop(&oxfw->tx_stream);
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>    331                          cmp_connection_break(&oxfw->out_conn);
>    332                  }
>    333          }
>    334  
>    335          if (!amdtp_stream_running(&oxfw->rx_stream)) {
>    336                  err = start_stream(oxfw, &oxfw->rx_stream);
>    337                  if (err < 0) {
>    338                          dev_err(&oxfw->unit->device,
>    339                                  "fail to start rx stream: %d\n", err);
>    340                          goto error;
>    341                  }
>    342          }
>    343  
>    344          if (oxfw->has_output) {
>    345                  if (!amdtp_stream_running(&oxfw->tx_stream)) {
>    346                          err = start_stream(oxfw, &oxfw->tx_stream);
>    347                          if (err < 0) {
>    348                                  dev_err(&oxfw->unit->device,
>    349                                          "fail to start tx stream: %d\n", err);
>    350                                  goto error;
>    351                          }
>    352                  }
>    353          }
>    354  
>    355          return 0;
>    356  error:
>    357          amdtp_stream_stop(&oxfw->rx_stream);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Smatch is basically complaining that we call amdtp_stream_stop() and
> it's not clear that we necessarily reset things.  I don't know this code
> very well so I have maybe missed something.
> 
>    358          cmp_connection_break(&oxfw->in_conn);
>    359          if (oxfw->has_output) {
>    360                  amdtp_stream_stop(&oxfw->tx_stream);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>    361                  cmp_connection_break(&oxfw->out_conn);
>    362          }
>    363          return err;
>    364  }
> 
> regards,
> dan carpenter

Thanks for you report, however the double-free doesn't occur because the
data of 'struct amdtp_stream' is protected by mutex and 'context' member
is a flag to call kernel APIs for 'struct iso_packets_buffer'. The kernel
API, amdtp_stream_stop()' can be called several times with no corruption.

```
(sound/firewire/amdtp-stream.c)
void amdtp_stream_stop(struct amdtp_stream *s)
{
    mutex_lock(&s->mutex);

    if (!amdtp_stream_running(s)) {
    	mutex_unlock(&s->mutex);
    	return;
    }
    ...
    fw_iso_context_destroy(s->context);
    s->context = ERR_PTR(-1);
    iso_packets_buffer_destroy(&s->buffer, s->unit);
    ...
    mutex_unlock(&s->mutex);
}
EXPORT_SYMBOL(amdtp_stream_stop);
```

``
(sound/firewire/amdtp-stream.h)
static inline bool amdtp_stream_running(struct amdtp_stream *s)
{
	return !IS_ERR(s->context);
}
``


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
