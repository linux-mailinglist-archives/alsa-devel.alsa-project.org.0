Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2A182B0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 01:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246D91877;
	Thu,  9 May 2019 01:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246D91877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557357878;
	bh=Ci8m8B/HD+eMq7V+ue1v12hIFTMOono5cG7e/vW1Myo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctasMu8rYa34JoP4zh4Hy+mUsF9EaTbnNwHgKABHSM7+6IDgtaelFhJz+YOu/sneF
	 NIB1IvLu12mgvsBidWH3coPDYwjvco/REiL4ROnPj5TAFhW7u+GhhyP0hu6UDkUkIm
	 5ONex91XQ9UY6vv5JAMsZ5ziBiF4FdHLeYYYSvVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98754F896F0;
	Thu,  9 May 2019 01:22:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55305F896F0; Thu,  9 May 2019 01:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_PASS,T_DKIMWL_WL_MED,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97BA8F807B5
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 01:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BA8F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IQWYMcYv"
Received: by mail-pl1-x644.google.com with SMTP id y3so153358plp.0
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 16:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C0dqNZfNpiVvA4CpPbArkMRFkpJeCyXIWnwTaD6mUwY=;
 b=IQWYMcYv7mtiGFbLr0eJ8XqY/U5XOI6n0lH7e4tqGbDzLAIX7U3yr9+o7gPifcVrvd
 QT3ytUORGHRkXJ6DU4wCEynfFV+iA5wgOtsz9E63B+rVEmFRlt1idMuTeLJ//lTJSV2Y
 QKbsezoDo4OspQixzJfBEFNeO08arTEw2G74drpySBmeHTEJr5UzCHyhXYSxWjFgr6Pm
 lMNUb9VwM1+I43se7zy+o0OeRlgnP+OGixvnOBs16SVuPILdNJuQAJc7ki3dE7Dh5ZWo
 cOMg2ANFNjijfvUO1m/CgIlU+nOKd3ZJyS5wkkTVClUPJS4aCLoR382QTKrl+MHcYYkM
 K4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C0dqNZfNpiVvA4CpPbArkMRFkpJeCyXIWnwTaD6mUwY=;
 b=AvOlSbsZWBV6EychIFSdPXinV9yPHuPRFJvZCTVEu7Kk867AASAyZgb7pvbzjtF0kk
 CVeTjJNkkbg5EzOW1Sel4n50Xfc/Djsw1k379GBpu571KRIyRSjOfx2AEDJMoYYikwi5
 h8gzsQFwtf10BDUT+Oxtsywvj92dcuipIsBrSkcqmZ6DJnBtn281bxwL9ulu+xfurHKU
 1ernOULm54pZRH5WTr3Wv+K7KUG3qWYeKcvYTGr9PW9rz9+NMCk7fygABtw8bPiqgCi1
 VH9aAzh4LKuspY0vtVQWG2nhjA2H1urO/uj2kULw4/Hw+yRIqL8Q0Qnt1iDqFjBQwi0l
 /F9Q==
X-Gm-Message-State: APjAAAVSTkdXQKkONi87CuA5ScOOb6tbzlgVLbfIZQzMD18TQSKVP1Qq
 gW/0Uo5N//7TdcbYfiSFgKGtWQ==
X-Google-Smtp-Source: APXvYqxxVGFKybsNdoXRBEXSjZIirCu6WEV3yHiY1Lmtj6dVNfAk/EWOAU4AGPg5i9njvoGbD+1edQ==
X-Received: by 2002:a17:902:102a:: with SMTP id
 b39mr621019pla.188.1557357766236; 
 Wed, 08 May 2019 16:22:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id n184sm460626pfn.21.2019.05.08.16.22.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 08 May 2019 16:22:44 -0700 (PDT)
Date: Wed, 8 May 2019 16:22:39 -0700
From: Benson Leung <bleung@google.com>
To: Gwendal Grignou <gwendal@chromium.org>
Message-ID: <20190508232239.GB41543@google.com>
References: <20190503220233.64546-1-gwendal@chromium.org>
 <20190503220233.64546-25-gwendal@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190503220233.64546-25-gwendal@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, bleung@chromium.org,
 tiwai@suse.com, groeck@chromium.org, broonie@kernel.org,
 enric.balletbo@collabora.com, lee.jones@linaro.org, jic23@kernel.org,
 cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v2 24/30] mfd: cros_ec: Add API for EC-EC
	communication
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
Content-Type: multipart/mixed; boundary="===============3755417370401129016=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3755417370401129016==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gwendal,

Really tiny commit message nit, otherwise look good.

On Fri, May 03, 2019 at 03:02:27PM -0700, Gwendal Grignou wrote:
> Allow EC to talk to other ECs that are not presented to the host.
> Neeed when EC are present in detachable keyboard.

s/Neeed/Needed


Thanks,
Benson
>=20
> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> ---
>  include/linux/mfd/cros_ec_commands.h | 95 ++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>=20
> diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cro=
s_ec_commands.h
> index 59ad6bae3f9b..52fd9bfafc7f 100644
> --- a/include/linux/mfd/cros_ec_commands.h
> +++ b/include/linux/mfd/cros_ec_commands.h
> @@ -5043,6 +5043,101 @@ struct ec_response_pd_chip_info_v1 {
>  	};
>  } __ec_align2;
> =20
> +/***********************************************************************=
******/
> +/* EC-EC communication commands: range 0x0600-0x06FF */
> +
> +#define EC_COMM_TEXT_MAX 8
> +
> +/*
> + * Get battery static information, i.e. information that never changes, =
or
> + * very infrequently.
> + */
> +#define EC_CMD_BATTERY_GET_STATIC 0x0600
> +
> +/**
> + * struct ec_params_battery_static_info - Battery static info parameters
> + * @index: Battery index.
> + */
> +struct ec_params_battery_static_info {
> +	uint8_t index;
> +} __ec_align_size1;
> +
> +/**
> + * struct ec_response_battery_static_info - Battery static info response
> + * @design_capacity: Battery Design Capacity (mAh)
> + * @design_voltage: Battery Design Voltage (mV)
> + * @manufacturer: Battery Manufacturer String
> + * @model: Battery Model Number String
> + * @serial: Battery Serial Number String
> + * @type: Battery Type String
> + * @cycle_count: Battery Cycle Count
> + */
> +struct ec_response_battery_static_info {
> +	uint16_t design_capacity;
> +	uint16_t design_voltage;
> +	char manufacturer[EC_COMM_TEXT_MAX];
> +	char model[EC_COMM_TEXT_MAX];
> +	char serial[EC_COMM_TEXT_MAX];
> +	char type[EC_COMM_TEXT_MAX];
> +	/* TODO(crbug.com/795991): Consider moving to dynamic structure. */
> +	uint32_t cycle_count;
> +} __ec_align4;
> +
> +/*
> + * Get battery dynamic information, i.e. information that is likely to c=
hange
> + * every time it is read.
> + */
> +#define EC_CMD_BATTERY_GET_DYNAMIC 0x0601
> +
> +/**
> + * struct ec_params_battery_dynamic_info - Battery dynamic info paramete=
rs
> + * @index: Battery index.
> + */
> +struct ec_params_battery_dynamic_info {
> +	uint8_t index;
> +} __ec_align_size1;
> +
> +/**
> + * struct ec_response_battery_dynamic_info - Battery dynamic info respon=
se
> + * @actual_voltage: Battery voltage (mV)
> + * @actual_current: Battery current (mA); negative=3Ddischarging
> + * @remaining_capacity: Remaining capacity (mAh)
> + * @full_capacity: Capacity (mAh, might change occasionally)
> + * @flags: Flags, see EC_BATT_FLAG_*
> + * @desired_voltage: Charging voltage desired by battery (mV)
> + * @desired_current: Charging current desired by battery (mA)
> + */
> +struct ec_response_battery_dynamic_info {
> +	int16_t actual_voltage;
> +	int16_t actual_current;
> +	int16_t remaining_capacity;
> +	int16_t full_capacity;
> +	int16_t flags;
> +	int16_t desired_voltage;
> +	int16_t desired_current;
> +} __ec_align2;
> +
> +/*
> + * Control charger chip. Used to control charger chip on the slave.
> + */
> +#define EC_CMD_CHARGER_CONTROL 0x0602
> +
> +/**
> + * struct ec_params_charger_control - Charger control parameters
> + * @max_current: Charger current (mA). Positive to allow base to draw up=
 to
> + *     max_current and (possibly) charge battery, negative to request cu=
rrent
> + *     from base (OTG).
> + * @otg_voltage: Voltage (mV) to use in OTG mode, ignored if max_current=
 is
> + *     >=3D 0.
> + * @allow_charging: Allow base battery charging (only makes sense if
> + *     max_current > 0).
> + */
> +struct ec_params_charger_control {
> +	int16_t max_current;
> +	uint16_t otg_voltage;
> +	uint8_t allow_charging;
> +} __ec_align_size1;
> +
>  /***********************************************************************=
******/
>  /*
>   * Reserve a range of host commands for board-specific, experimental, or
> --=20
> 2.21.0.1020.gf2820cf01a-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6gYDF28Li+nEiKLaHwn1ewov5lgFAlzTZL8ACgkQHwn1ewov
5lgliBAAi2Xkq93LTZDfzRbcO20fikTdY5Os7wvDskLQqxOhuCQegTvlsMT5H4NZ
CHowvQYqTXOJHnAVO9PdwZ52a6LXuvFf6mHrHlS1wKHVnBaWoUvY1mbPT8OMXaWf
ixJ8adShf43SdVP7IPjj5HPYv3qdCknqOGJMonUjNM2FFn5YXjYbtOFjwrOohdMT
iGoy2TOxpb8j5LK/Kgnzy5i9BcSQ1QkNggBedPoM/jRHw7IE/WKO4X1L9HLiHcVy
UuvYMSAzRVP+80HbMCAAjBvrmD3ngVyHvIjVl5jcjpw2JkpayMpCHWHAIU2hKjN5
qehGEdME9Uy8pwdab3n/7fuH+blawfCKjI73oyYly4xkbvRDlWCXRhKGMQMbBTMR
s60Bjl4TXQfyrWzivPATHaH55OXiQa6dsmcOz0c64+jMTi0AEgBTuR6g9FwEBe23
fqRO4sapql8jaq4K6jyvurM8ElrjF0ubTXHsTUD2n9bPxbk48KhwtEetzzKuAVit
I4BrnNZQV8yXfoiYRB839bGdKHgxIR19PA8xP+64I5UfKWyCzIq9flSjgFMlA35T
7AUol4jfr36gJppK1hdZW3VPEcpA/5MycUc00vRqzM5AkiqUvIeaxuvlFSWpUkl9
VDy1jzZ0pW9JlAboUear7pyrRaP3uZfrjwVCYFqC2zJXaedFmko=
=krvY
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--

--===============3755417370401129016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3755417370401129016==--
