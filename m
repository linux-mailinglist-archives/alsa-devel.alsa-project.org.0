Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D367FD53
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 08:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A14686E;
	Sun, 29 Jan 2023 08:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A14686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674976258;
	bh=5QzWA80JnAMHP8PX2TMVNUHFE4JYQUNbxY2QalPX/4w=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U6d1mODpvQ2WGU4jV2WVi4gxcNNumLHZmy8w4qRnqsnbfSy+VJSmGioj2MsVTsEs9
	 02xIQQIH9P10Ypfey7wfNs2n+c5uNiqL1Ot7izFAHIhSIyHRQHIr9ROoXf2BuvSvuk
	 lqg+52s7Lif2iqYOyXUN33me1wsQ4Qx5mzWUHYAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B542F804C2;
	Sun, 29 Jan 2023 08:10:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B57F804B2; Sun, 29 Jan 2023 08:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46B91F8007C
 for <alsa-devel@alsa-project.org>; Sun, 29 Jan 2023 08:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46B91F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rhzlM/PX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A38B0B80949;
 Sun, 29 Jan 2023 07:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCEDC433D2;
 Sun, 29 Jan 2023 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674976189;
 bh=5QzWA80JnAMHP8PX2TMVNUHFE4JYQUNbxY2QalPX/4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rhzlM/PXVF3UGJ8Gzuu6E/mwYY6fuDkK7gh6hj+7cnJUYwy65c8kVUrOxYUdB0R4/
 jEQuUO6poSKB7P3QP3myRBJEg0gNKAUCmXILtzf5TOnl0yWPBWQPVlO/sZc4XuQxmF
 RngB74fzeURIwYGOagNvLrAuw+DDA5Ht9VXJ85Wo=
Date: Sun, 29 Jan 2023 08:09:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhou Furong <furong.zhou@linux.intel.com>
Subject: Re: [RFC PATCH v2 07/22] ASoC: Add SOC USB APIs for adding an USB
 backend
Message-ID: <Y9YbumlV9qh+k68h@kroah.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-8-quic_wcheng@quicinc.com>
 <Y9UiiMbJFjkzyEol@kroah.com>
 <7c1d80b6-5db3-9955-0a67-908455bd77fa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c1d80b6-5db3-9955-0a67-908455bd77fa@linux.intel.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, Jan 29, 2023 at 02:54:43PM +0800, Zhou Furong wrote:
> 
> 
> > > +void *snd_soc_usb_get_priv_data(struct device *usbdev)
> > > +{
> > > +	struct snd_soc_usb *ctx;
> > > +
> > > +	if (!usbdev)
> > > +		return NULL;
> > 
> > How could usbdev ever be NULL?
> The method is exported to public, valid check should be reasonable
> as someone may call it by mistake

We do not protect the kernel from itself like this, no need to check
things that should never happen.  If the caller gets it wrong, their
code will break :)

thanks,

greg k-h
