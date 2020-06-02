Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29521EBC01
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 14:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99C331661;
	Tue,  2 Jun 2020 14:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99C331661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591102009;
	bh=CqEkPSEG6NPS/2M56vKixq8BqVs7Fuvbf11dmU8UkwQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFcn+Nixk1dtPMwCGvyvmNOfgHnhdwNuIlHahuPhAqCZ+9yiVn5nR1qJF0cyoDP/G
	 5ypxY5XQscDtWugxU44g4ES85LouME+mnEGZpidRCa5yRBJyVez3gTPAw5D5anyfeI
	 NJpBlQskrQE6xjRSWHFsh80PJJxLdo7ECpPAB7Wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7036F80272;
	Tue,  2 Jun 2020 14:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36000F8026F; Tue,  2 Jun 2020 14:45:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5076F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 14:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5076F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="j5FBhoLT"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CacON189542;
 Tue, 2 Jun 2020 12:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UBDMz9NlvYHl649uFsBp8WuLVJ9aVdmnCyvloWHY3iI=;
 b=j5FBhoLTTvFUfwqLW06mrGaHCgTsehDy5lsbtZWAYbr/d0d1IyKDx2pdQXSkf5ws13gr
 GInvov+URNvOD1xqIM6l2KcUwqrLGSuQGSBwUwIdxJbazfiP5tRoB/QH3YfsB5oJyvnJ
 PbC/7MWs9QHUlC3jrTbzb77fDVI8FW8PF8eAN7m2dw235L+uKNksYu08+4fThRNO4ueX
 cw6fOmhE13jniYBnyXix2ZPxeWIFnhoIX1CxBczbbmJLp4tMN+vgYogosuN7mOL/TZtc
 LsWCd47DT0ZsRRKrmAcm+xAdVxqxo6J87129P8MCQOYBsjmF7+sfrvuw9LGR15bc+Thm 3w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 31bfem3s7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 12:44:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CcLGU008671;
 Tue, 2 Jun 2020 12:44:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 31dju1bycv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 12:44:58 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052CirVp022788;
 Tue, 2 Jun 2020 12:44:54 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 05:44:51 -0700
Date: Tue, 2 Jun 2020 15:44:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Subject: Re: [RESEND PATCH v1 5/6] staging: greybus: audio: Add helper APIs
 for dynamic audio modules
Message-ID: <20200602124439.GH30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <c1339e4d57c8b39bd25197d4514fabd868b829b1.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1339e4d57c8b39bd25197d4514fabd868b829b1.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020089
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Jun 02, 2020 at 10:51:14AM +0530, Vaibhav Agarwal wrote:
> +static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
> +				   const struct snd_kcontrol_new *controls,
> +				   int num_controls, const char *prefix)
> +{
> +	int i, err;
> +
> +	for (i = 0; i < num_controls; i++) {
> +		const struct snd_kcontrol_new *control = &controls[i];
> +		struct snd_ctl_elem_id id;
> +		struct snd_kcontrol *kctl;
> +
> +		if (prefix)
> +			snprintf(id.name, sizeof(id.name), "%s %s", prefix,
> +				 control->name);
> +		else
> +			strlcpy(id.name, control->name, sizeof(id.name));
> +		id.numid = 0;
> +		id.iface = control->iface;
> +		id.device = control->device;
> +		id.subdevice = control->subdevice;
> +		id.index = control->index;
> +		kctl = snd_ctl_find_id(card, &id);
> +		if (!kctl) {
> +			dev_err(dev, "%d: Failed to find %s\n", err,
> +				control->name);
> +			return -ENOENT;

I feel like this should be a continue instead of a return.

> +		}
> +		err = snd_ctl_remove(card, kctl);
> +		if (err < 0) {
> +			dev_err(dev, "%d: Failed to remove %s\n", err,
> +				control->name);
> +			return err;

Probably here as well.  The caller doesn't actually check for errors.

> +		}
> +	}
> +	return 0;
> +}

