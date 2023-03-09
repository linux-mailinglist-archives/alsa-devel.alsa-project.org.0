Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 287AC6B1BC5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 07:47:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3990418A7;
	Thu,  9 Mar 2023 07:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3990418A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678344430;
	bh=oS5Du0iAPnOVgwot0CXctvGp/xcbqSatUPFEbkf5n6w=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GxQ4+h3JU3Ec5eg3Px0B82LU7npnBs+LbMWy4CkJ03larqH2EJ2SxZS+Z/jsqPWS+
	 iu9tDDOx1KIWFpJ2abGzIkQhL+Oow9Ob0Am7T+aPdNriItVwxeXfgJzuJQ5/NDgTlk
	 Os1LDK4LiNhI84jeAhHsjDt3dNpyUl3xZsJW+mK8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC1C6F80236;
	Thu,  9 Mar 2023 07:46:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73E8AF8042F; Thu,  9 Mar 2023 07:46:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A216F800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 07:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A216F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ykNgJTHX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0C507CE2283;
	Thu,  9 Mar 2023 06:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61ADC433D2;
	Thu,  9 Mar 2023 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678344363;
	bh=oS5Du0iAPnOVgwot0CXctvGp/xcbqSatUPFEbkf5n6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ykNgJTHX7Zf3nvuXnS0xHP+nA2BxOCOOG+UGEL5w+2XDS+tFOhOvYliLHGR1Bhgda
	 s84EvWQ9G7QbwLuBIV1gyUEfyLZI0GaWhthUDDY/o3bOrNTO4vJGzZbHukVlni0+k6
	 n2redErcF2q1X7zFeycnWMeasREPKZu2IMl15gns=
Date: Thu, 9 Mar 2023 07:46:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v3 00/28] Introduce QC USB SND audio offloading support
Message-ID: <ZAmAqGg7NglUw8MO@kroah.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
Message-ID-Hash: 3DXTW5BE3ZQHPO4QPVM64M23QB5CXETL
X-Message-ID-Hash: 3DXTW5BE3ZQHPO4QPVM64M23QB5CXETL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
 andersson@kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DXTW5BE3ZQHPO4QPVM64M23QB5CXETL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 08, 2023 at 03:57:23PM -0800, Wesley Cheng wrote:
> Changes in v3:
> - Changed prefix from RFC to PATCH
> - Rebased entire series to usb-next
> - Updated copyright years

This is much better, thanks.  I've done some very brief high-level
skimming and found minor issues, and one major one.  I'll let others
review this in more depth right now, as I am way behind in reviewing
other USB patches and need to get to them first.

thanks,

greg k-h
